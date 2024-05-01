// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dienstleisto/backend/provider/provider.dart';

class ProfileAPI {
  //Request Methods
  Future<bool> postRequest(String url, Map<String, String> body) async {
    String userLoginToken = UserProvider().token;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $userLoginToken',
        },
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
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

  //fetch Education infor using the ID
  Future<bool> getUserEducation(int userId) async {
    final response = await http.get(
      Uri.parse('http://dienstleisto.de/api/education/$userId'),
    );

    if (response.statusCode == 200) {
      String education = jsonDecode(response.body)['education'];
      print("--------------------------------------------");
      print('User education: $education');
      print("--------------------------------------------");
      return true;
    } else {
      print(
          'Failed to fetch user education. Status code: ${response.statusCode}');
      return false;
      // throw Exception('Failed to load user education');
    }
  }

  //update Expereince
  Future<bool> updateExperience({
    required List<String> titles,
    required List<String> companies,
    required List<String> companyStartDates,
    required List<String> summaries,
    required List<String> companyEndDates,
  }) async {
    if (titles.length != companies.length ||
        companies.length != companyStartDates.length ||
        companyStartDates.length != summaries.length ||
        summaries.length != companyEndDates.length) {
      print(
          'The number of titles, companies, company start dates, summaries, and company end dates must be the same.');
      return false;
    }

    Map<String, String> body = {};
    for (int i = 0; i < titles.length; i++) {
      body['etitle[$i]'] = titles[i];
      body['ecomany[$i]'] = companies[i];
      body['companysd[$i]'] = companyStartDates[i];
      body['esummry[$i]'] = summaries[i];
      body['companyed[$i]'] = companyEndDates[i];
    }

    return postRequest('http://dienstleisto.de/api/experience', body);
  }

  //get user laguage
  Future<bool> getUserLanguages(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('http://dienstleisto.de/api/language/$userId'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        List<dynamic> languages = responseBody['languages'];
        List<dynamic> professions = responseBody['p_lang'];
        print("-------------------------------------------------");
        print('User languages: $languages');
        print('User professions: $professions');
        print("-------------------------------------------------");
        return true;
      } else {
        print(
            "-------------------------------------------------------------------");
        print(
            'Failed to load user languages. Status code: ${response.statusCode}');
        print(
            "------------------------------------------------------------------");
        return false;
      }
    } catch (e) {
      print("-------------------------------------------------");
      print('An error occurred: $e');
      print("-------------------------------------------------");
      return false;
    }
  }

  // Update la  nguage
  Future<bool> updateLanguages({
    required List<String> languages,
    required List<String> proficiencies,
  }) async {
    if (languages.length != proficiencies.length) {
      print('The number of languages and proficiencies must be the same.');
      return false;
    }

    Map<String, String> body = {};
    for (int i = 0; i < languages.length; i++) {
      body['languages[$i]'] = languages[i];
      body['p_lang[$i]'] = proficiencies[i];
    }

    return postRequest('http://dienstleisto.de/api/language', body);
  }
}
