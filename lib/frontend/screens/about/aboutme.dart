// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:dienstleisto/backend/api/profile/api_get_profile.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/frontend/screens/about/aboutmetemplate.dart';
import 'package:dienstleisto/frontend/screens/about/setting/setting.dart';
import 'package:dienstleisto/frontend/screens/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
  });

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final GetProfileAPI getprofileAPI = GetProfileAPI();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int id = prefs.getInt('User_id_memory') ?? 0;
      UserProvider userProvider =
          Provider.of<UserProvider>(context, listen: false);

      getprofileAPI.getUserProfile(id, context, userProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = context.watch<UserProvider>();

    String aboutMeText = userProvider.aboutMe;
    String name = userProvider.name;
    String jobTitle = userProvider.proffesion;
    String profileImageUrl = userProvider.profilePic;
    String mobilePhone = userProvider.phoneNo;
    String emailAddress = userProvider.email;
    String address = userProvider.userAddress;
    String facebookLink = userProvider.facebook;
    String twitterLink = userProvider.twitter;
    String instagramLink = userProvider.instagram;
    String websiteLink = userProvider.website;
    String otherLink = userProvider.other;
    String youtubeLink = userProvider.youtube;
    print("-----------------------------------------------");
    print("Profile URL: $profileImageUrl");
    print("-----------------------------------------------");
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeftWithFade,
                child: const SettingPage(),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 'Logout',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'Logout') {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('Yes'),
                          onPressed: () async {
                            Navigator.of(context).pop();

                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: const login(),
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      body: AboutMeTemplate(
        aboutMeText: aboutMeText,
        name: name,
        jobTitle: jobTitle,
        profileImageUrl: profileImageUrl,
        mobilePhone: mobilePhone,
        emailAddress: emailAddress,
        address: address,
        facebookLink: facebookLink,
        twitterLink: twitterLink,
        instagramLink: instagramLink,
        websiteLink: websiteLink,
        otherLink: otherLink,
        youtubeLink: youtubeLink,
      ),
    );
  }
}
