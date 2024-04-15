import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

class ProfileAPI {
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
        // If the server returns a 200 OK response, then parse the JSON.
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
        // If the server returns a response code other than 200, throw an exception.
        print('Failed to update profile. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  // Update Education:
  Future<bool> updateEducation({
    required String title,
    required String type,
    required String startYear,
    required String endYear,
    required String summary,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/education'),
        body: {
          'd_title[0]': title,
          'd_type[0]': type,
          'd_syear[0]': startYear,
          'd_eyear[0]': endYear,
          'd_summary[0]': summary,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then parse the JSON.
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          print('Education updated successfully');
          return true;
        } else {
          print('Failed to update education: ${responseBody['message']}');
          return false;
        }
      } else {
        // If the server returns a response code other than 200, throw an exception.
        print(
            'Failed to update education. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }

  // Update Experience:
  Future<bool> updateExperience({
    required String title,
    required String company,
    required String companyStartDate,
    required String summary,
    required String companyEndDate,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('http://dienstleisto.de/api/experience'),
        body: {
          'etitle[0]': title,
          'ecomany[0]': company,
          'companysd[0]': companyStartDate,
          'esummry[0]': summary,
          'companyed[0]': companyEndDate,
        },
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then parse the JSON.
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        if (responseBody['success']) {
          print('Experience updated successfully');
          return true;
        } else {
          print('Failed to update experience: ${responseBody['message']}');
          return false;
        }
      } else {
        // If the server returns a response code other than 200, throw an exception.
        print(
            'Failed to update experience. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('An error occurred: $e');
      return false;
    }
  }
}
