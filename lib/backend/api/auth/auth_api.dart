// ignore_for_file: use_build_context_synchronously, , unnecessary_null_comparison

import 'dart:io';

import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/errorAndLoading/errorHandelling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final storage = const FlutterSecureStorage();

  Future<bool> loginAPI(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        String? token = responseBody['token'];
        Map<String, dynamic> user = responseBody['user'];
        String? role = user['role'];
        if (token != null) {
          await storage.write(key: 'User_login_token', value: token);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('User_login_token', token);
          await prefs.setInt('User_id_memory', user['id'] ?? 0);

          // Save the user data to UserProvider
          UserProvider userProvider =
              Provider.of<UserProvider>(context, listen: false);
          userProvider.setId(user['id'].toString());
          userProvider.setToken(token);
          userProvider.setRole(role ?? '');
          userProvider.setEmail(user['email'] ?? '');

          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> isLoggedIn(BuildContext context) async {
    String? token = await storage.read(key: 'User_login_token');
    return token != null && token.isNotEmpty;
  }

  //-----------------
  // Logout API
  //-----------------

  Future<bool> logoutAPI(String email, BuildContext context) async {
    String? token = await storage.read(key: 'User_login_token');

    if (token != null && token.isNotEmpty) {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        await storage.delete(key: 'User_login_token');
        return true;
      } else {
        return false;
      }
    } else {
      print('No token found');
      return false;
    }
  }

  //-----------------
  // Forget Password
  //-----------------
  Future<bool> resetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/forgotpassword'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  //-------------------------------
  // Sign in with google
  //Problem: need to sign key
  //-------------------------------
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('User cancelled sign-in');
      }

      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/googlelogin'),
        body: {
          'email': googleUser.email,
        },
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to login');
      }
    } on SocketException {
      showErrorDialog(context, 'No Internet connection');
    } on HttpException {
      showErrorDialog(context, "HTTP error");
    } on FormatException {
      showErrorDialog(context, "Format Expection Error");
    } catch (e) {
      showErrorDialog(context, "error: $e");
    }
  }

  //-------------------------
  // Update the Password
  //-------------------------
  Future<void> updatePassword(
      String email,
      String currentPassword,
      String newPassword,
      String passwordConfirmation,
      BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/login'),
        body: {
          'email': email,
          'current_password': currentPassword,
          'password': newPassword,
          'password_confirmation': passwordConfirmation,
        },
      );

      if (response.statusCode == 200) {
      } else {
        throw Exception('Failed to update password');
      }
    } on SocketException {
      showErrorDialog(context, 'No Internet connection');
    } on HttpException {
      showErrorDialog(context, "HTTP error");
    } on FormatException {
      showErrorDialog(context, "Format Expection Error");
    } catch (e) {
      showErrorDialog(context, "error: $e");
    }
  }

  //-----------------
  // Register User
  //-----------------

  Future<Map<String, dynamic>> registerUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String selectedCountryName,
    required String city,
    required String address,
    required String firstName,
    required String lastName,
    required String passwordConfirmation,
    required String mode,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phoneno': phone,
          'selectedCountryName': selectedCountryName,
          'city': city,
          'address': address,
          'first_name': firstName,
          'last_name': lastName,
          'password_confirmation': passwordConfirmation,
          'mode': mode,
          'role': role,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'message':
              'User registered successfully!! Please check your email for verification link.'
        };
      } else {
        return {
          'success': false,
          'message':
              'Failed to register user. Status code: ${response.statusCode}. Response body: ${response.body}'
        };
      }
    } on SocketException {
      return {'success': false, 'message': 'No Internet connection'};
    } on HttpException {
      return {'success': false, 'message': 'Could not find the server'};
    } on FormatException {
      return {'success': false, 'message': 'Bad response format'};
    } catch (e) {
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
