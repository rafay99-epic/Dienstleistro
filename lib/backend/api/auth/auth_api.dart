// ignore_for_file: use_build_context_synchronously, avoid_print, unnecessary_null_comparison

import 'dart:io';

import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication {
  //-----------------
  // Google Sign In
  //-----------------
  final GoogleSignIn googleSignIn = GoogleSignIn();

  //-----------------------
  // Login API
  //  Role Based Login
  //    1. Seller
  //    2. Customer
  //  Auth Gate
  //----------------------
  Future<bool> loginAPI(
      String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('https://dienstleisto.chumairabdullah.com/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        //     print('Login successful');
        //   print('Response body: ${response.body}');
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        // print('Response body map: $responseBody');
        String? token = responseBody['token'];
        print('Token: $token');
        Map<String, dynamic> user = responseBody['user'];
        String? role = user['role']; // Extract the role from the user object
        if (token != null) {
          // Update the UserProvider with the new token and role
          Provider.of<UserProvider>(context, listen: false).setToken(token);
          Provider.of<UserProvider>(context, listen: false).setRole(role ?? '');
          return true;
        } else {
          print('Token is null');
          return false;
        }
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  //---------------------------------
  // Check for User is Logged in
  //---------------------------------
  Future<bool> isLoggedIn(BuildContext context) {
    String? token = Provider.of<UserProvider>(context, listen: false).token;
    return Future.value(token != null && token.isNotEmpty);
  }

  //-----------------
  // Logout API
  //-----------------
  Future<bool> logoutAPI(String email, BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String? token = userProvider.token;

    if (token.isNotEmpty) {
      final response = await http.post(
        Uri.parse('https://dienstleisto.chumairabdullah.com/api/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        print('Logout successful');
        userProvider.clear();
        return true;
      } else {
        print('Failed to logout. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
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
        Uri.parse(
            'https://dienstleisto.chumairabdullah.com/api/forgotpassword'),
        body: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON.
        print('Password reset successful');
        print('Response body: ${response.body}');
        return true;
      } else {
        // If the server returns an unsuccessful response code, throw an exception.
        print('Failed to reset password');
        return false;
      }
    } catch (e) {
      // If an error occurs, print it to the console and return false.
      print('An error occurred: $e');
      return false;
    }
  }

  //-------------------------------
  // Sign in with google
  //Problem: need to sign key
  //-------------------------------
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw Exception('User cancelled sign-in');
      }

      final response = await http.post(
        Uri.parse('https://dienstleisto.chumairabdullah.com/api/googlelogin'),
        body: {
          'email': googleUser.email, // Send the email to your server
        },
      );

      if (response.statusCode == 200) {
        print('Login successful');
      } else {
        print('Failed to login. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to login');
      }
    } on SocketException {
      print('No Internet connection');
      // handle the SocketException
    } on HttpException {
      print('Could not find the server');
      // handle the HttpException
    } on FormatException {
      print('Bad response format');
      // handle the FormatException
    } catch (e) {
      print('Error occurred while signing in with Google: $e');
      // handle any other types of exceptions
    }
  }

  //-------------------------
  // Update the Password
  //-------------------------
  Future<void> updatePassword(String email, String currentPassword,
      String newPassword, String passwordConfirmation) async {
    try {
      final response = await http.post(
        Uri.parse('https://dienstleisto.chumairabdullah.com/api/login'),
        body: {
          'email': email,
          'current_password': currentPassword,
          'password': newPassword,
          'password_confirmation': passwordConfirmation,
        },
      );

      if (response.statusCode == 200) {
        print('Password updated successfully');
      } else {
        print('Failed to update password. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to update password');
      }
    } on SocketException {
      print('No Internet connection');
      // handle the SocketException
    } on HttpException {
      print('Could not find the server');
      // handle the HttpException
    } on FormatException {
      print('Bad response format');
      // handle the FormatException
    } catch (e) {
      print('Error occurred while updating password: $e');
      // handle any other types of exceptions
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
        Uri.parse('http://18.195.68.122/api/register'),
        body: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
          'selectedCountryName': selectedCountryName,
          'city': city,
          'address': address,
          'firstName': firstName,
          'lastName': lastName,
          'passwordConfirmation': passwordConfirmation,
          'mode': mode,
          'role': role,
        },
      );

      if (response.statusCode == 200) {
        print('User registered successfully');
        return {'success': true, 'message': 'User registered successfully'};
      } else {
        print('Failed to register user. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        return {
          'success': false,
          'message':
              'Failed to register user. Status code: ${response.statusCode}. Response body: ${response.body}'
        };
      }
    } on SocketException {
      print('No Internet connection');
      return {'success': false, 'message': 'No Internet connection'};
    } on HttpException {
      print('Could not find the server');
      return {'success': false, 'message': 'Could not find the server'};
    } on FormatException {
      print('Bad response format');
      return {'success': false, 'message': 'Bad response format'};
    } catch (e) {
      print('An error occurred: $e');
      return {'success': false, 'message': 'An error occurred: $e'};
    }
  }
}
