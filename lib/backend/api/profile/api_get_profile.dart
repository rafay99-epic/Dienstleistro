// ignore_for_file: avoid_print, use_build_context_synchronously
import 'package:dienstleisto/backend/class/awards_class.dart';
import 'package:dienstleisto/backend/class/education.dart';
import 'package:dienstleisto/backend/class/language_class.dart';
import 'package:dienstleisto/backend/class/skill_class.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetProfileAPI {
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

        List<dynamic> skillsJson = userProfile['skills'] ?? [];
        userProvider.setSkills(
            skillsJson.map((json) => UserSkill.fromJson(json)).toList());

        //user education
        List<dynamic> educationsJson = userProfile['educations'] ?? [];
        userProvider.setEducations(educationsJson.map((json) {
          UserEducation education = UserEducation.fromJson(json);
          return education;
        }).toList());
        List<dynamic> languagesJson = userProfile['languages'] ?? [];
        userProvider.setLanguages(
            languagesJson.map((json) => UserLanguage.fromJson(json)).toList());

        List<dynamic> awardsJson = userProfile['awards'] ?? [];
        userProvider.setAwards(
            awardsJson.map((json) => UserAward.fromJson(json)).toList());

        // userProvider
        //     .setLanguages(List<String>.from(userProfile['languages'] ?? []));
        // userProvider.setExperiences(
        //     List<String>.from(userProfile['experiences'] ?? []));
        // userProvider.setAwards(List<String>.from(userProfile['awards'] ?? []));
        // userProvider
        //     .setServices(List<String>.from(userProfile['services'] ?? []));
        // userProvider
        //     .setFollowers(List<String>.from(userProfile['followers'] ?? []));

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
