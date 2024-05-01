// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileUpdate {
  final storage = const FlutterSecureStorage();

  Future<bool> updateProfile({
    required String name,
    required String phoneNo,
    required String gender,
    required String language,
    required String country,
    required String address,
    required String state,
    required String zipCode,
    required String about,
    required String facebook,
    required String youtube,
    required String twitter,
    required String instagram,
    required String website,
    required String other,
    required String profession,
  }) async {
    String url = 'http://dienstleisto.de/api/basicupdate/';
    // String userLoginToken = UserProvider().token;
    String? token = await storage.read(key: 'User_login_token');

    Map<String, String> body = {
      'name': name,
      'phoneNo': phoneNo,
      'gender': gender,
      'language': language,
      'country': country,
      'address': address,
      'state': state,
      'zipCode': zipCode,
      'about': about,
      'facebook': facebook,
      'youtube': youtube,
      'twitter': twitter,
      'instagram': instagram,
      'website': website,
      'other': other,
      'profession': profession,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['message'] == 'saved') {
          print('Request successful');
          return true;
        } else {
          print('Failed to make request: ${responseBody['message']}');
          return false;
        }
      } else {
        print('Failed to make request. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
