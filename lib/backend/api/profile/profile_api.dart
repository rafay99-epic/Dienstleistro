// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
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

  //basic profile
  Future<bool> basicUpdate({
    required File bannerImage,
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
    required String imgCode,
  }) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('http://dienstleisto.de/api/basicupdate'));

      request.files.add(
          await http.MultipartFile.fromPath('Bannerimage', bannerImage.path));

      request.fields['name'] = name;
      request.fields['phoneno'] = phoneNo;
      request.fields['gender'] = gender;
      request.fields['language'] = language;
      request.fields['country'] = country;
      request.fields['address'] = address;
      request.fields['state'] = state;
      request.fields['zipcode'] = zipCode;
      request.fields['about'] = about;
      request.fields['facebook'] = facebook;
      request.fields['youtube'] = youtube;
      request.fields['twitter'] = twitter;
      request.fields['instagram'] = instagram;
      request.fields['website'] = website;
      request.fields['other'] = other;
      request.fields['Proffesion'] = profession;
      request.fields['imgcode'] = imgCode;

      var response = await request.send();

      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        Map<String, dynamic> responseBody = jsonDecode(respStr);
        if (responseBody['success']) {
          print('Profile updated successfully');
          return true;
        } else {
          print('Failed to update profile: ${responseBody['message']}');
          return false;
        }
      } else {
        print('Failed to update profile. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  //update Education
  Future<bool> updateEducation({
    required List<String> titles,
    required List<String> types,
    required List<String> startYears,
    required List<String> endYears,
    required List<String> summaries,
  }) async {
    if (titles.length != types.length ||
        types.length != startYears.length ||
        startYears.length != endYears.length ||
        endYears.length != summaries.length) {
      print(
          'The number of titles, types, start years, end years, and summaries must be the same.');
      return false;
    }

    Map<String, String> body = {};
    for (int i = 0; i < titles.length; i++) {
      body['d_title[$i]'] = titles[i];
      body['d_type[$i]'] = types[i];
      body['d_syear[$i]'] = startYears[i];
      body['d_eyear[$i]'] = endYears[i];
      body['d_summary[$i]'] = summaries[i];
    }

    return postRequest('http://dienstleisto.de/api/education', body);
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

  // Update Skills
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

  Future<bool> getUserProfile(
      int id, BuildContext context, UserProvider userProvider) async {
    try {
      final response = await http
          .get(Uri.parse('http://dienstleisto.de/api/getprofile?id=$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Map<String, dynamic> userProfile = data['User'];

        print("User Data: $userProfile");

        userProvider.setName(userProfile['name'] ?? '');
        userProvider.setEmail(userProfile['email'] ?? '');
        userProvider.setProfilePic(userProfile['profilepic'] ?? '');
        userProvider.setPhoneNo(userProfile['phoneno'] ?? '');
        userProvider.setUserAddress(userProfile['address'] ?? '');
        userProvider.setUserCountry(userProfile['country'] ?? '');
        userProvider.setUserState(userProfile['state'] ?? '');
        userProvider.setUserLanguage(userProfile['language'] ?? '');
        userProvider.setUserZipcode(userProfile['zipcode'] ?? '');
        userProvider.setAboutMe(userProfile['about'] ?? '');
        userProvider.setFacebook(userProfile['facebook'] ?? '');
        userProvider.setTwitter(userProfile['twitter'] ?? '');
        userProvider.setInstagram(userProfile['instagram'] ?? '');
        userProvider.setWebsite(userProfile['website'] ?? '');
        userProvider.setOther(userProfile['Other'] ?? '');
        userProvider.setProffesion(userProfile['Proffesion'] ?? '');
        userProvider.setUsergender(userProfile['gender'] ?? '');
        userProvider.setYoutube(userProfile['youtube'] ?? '');
        return true;
      } else {
        print(
            'Failed to load user profile. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
