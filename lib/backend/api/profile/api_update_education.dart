import 'dart:convert';

import 'package:dienstleisto/backend/class/language_class.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UpdateLanguageAPI {
  final UserProvider userProvider = UserProvider();
  final storage = const FlutterSecureStorage();

  Future<bool> updateLanguage(UserLanguage language) async {
    try {
      String? token = await storage.read(key: 'User_login_token');
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/language/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'name': language.name,
          'percentage': language.percentage.toString(),
        }),
      );

      print('Server response: ${response.body}');

      if (response.statusCode >= 200 && response.statusCode < 300) {
        userProvider.setLanguages(userProvider.languages
            .map((lang) => lang.id == language.id ? language : lang)
            .toList());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception('Failed to update language');
    }
  }
}
