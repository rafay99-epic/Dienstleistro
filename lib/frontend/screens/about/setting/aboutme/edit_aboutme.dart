// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:dienstleisto/backend/api/profile/profile_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class EditAboutMe extends StatefulWidget {
  const EditAboutMe({super.key});

  @override
  _EditAboutMeState createState() => _EditAboutMeState();
}

class _EditAboutMeState extends State<EditAboutMe> {
  final TextEditingController aboutMeController = TextEditingController();
  late UserProvider provider = UserProvider();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
    aboutMeController.text = provider.aboutMe;
  }

  @override
  void dispose() {
    aboutMeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                MyText(
                  text: "Update About Me",
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.center,
                  fontFamily: "ABeeZee",
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: aboutMeController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Edit About Me',
                    fillColor: Theme.of(context).colorScheme.background,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'ABeeZee',
                      fontStyle: FontStyle.normal,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          updateAboutme(context);
                        },
                        child: MyText(
                          text: 'Update',
                          color: Theme.of(context).colorScheme.background,
                          fontFamily: 'ABeeZee',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          aboutMeController.clear();
                          Navigator.pop(context);
                        },
                        child: MyText(
                          text: 'Cancel',
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'ABeeZee',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/images/banner.jpg');

    final file = File('${(await getTemporaryDirectory()).path}/banner.jpg');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  Future<void> updateAboutme(BuildContext context) async {
    ProfileAPI profileAPI = ProfileAPI();
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String aboutMe = aboutMeController.text;
    userProvider.setAboutMe(aboutMe);

    // Get the data from the provider
    String name = userProvider.name;
    String phoneNo = userProvider.phoneNo;
    String usergender = userProvider.usergender;
    String userlanguage = userProvider.userlanguage;
    String userCountry = userProvider.userCountry;
    String userAddress = userProvider.userAddress;
    String userState = userProvider.userState;
    String userZipcode = userProvider.userZipcode;
    String aboutMeNew = userProvider.aboutMe;
    String facebook = userProvider.facebook;
    String youtube = userProvider.youtube;
    String twitter = userProvider.twitter;
    String instagram = userProvider.instagram;
    String website = userProvider.website;
    String other = userProvider.other;
    String proffesion = userProvider.proffesion;
    String imgCode = userProvider.profilePic;

    // Create a File for the bannerImage
    // File bannerImage = File('/assets/images/banner.jpg');

    File bannerImage = await getImageFileFromAssets('assets/images/banner.jpg');

    // Call the basicUpdate function
    bool success = await profileAPI.basicUpdate(
      bannerImage: bannerImage,
      name: name,
      phoneNo: phoneNo,
      gender: usergender,
      language: userlanguage,
      country: userCountry,
      address: userAddress,
      state: userState,
      zipCode: userZipcode,
      about: aboutMeNew,
      facebook: facebook,
      youtube: youtube,
      twitter: twitter,
      instagram: instagram,
      website: website,
      other: other,
      profession: proffesion,
      imgCode: imgCode,
    );

    if (success) {
      print('Profile updated successfully');
    } else {
      print('Failed to update profile');
    }
  }
}
