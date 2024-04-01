import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  // Login API with Auth Gate

  Future<bool> loginAPI(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://dienstleisto.chumairabdullah.com/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('Login successful');
        print('Response body: ${response.body}');
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        print('Response body map: $responseBody');
        String? token = responseBody['token'];
        if (token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
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

  //Is user logged in function
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token != null;
  }

  //Logout API
  Future<bool> logoutAPI(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
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
        await prefs.remove('token');
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

  //forget Password
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

  // Sign in with google
  //Problem: need to sign key
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

  // Update the password
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
}
