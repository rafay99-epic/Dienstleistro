// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:dienstleisto/frontend/screens/about/aboutmetemplate.dart';
import 'package:dienstleisto/frontend/screens/about/setting.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
  });

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  //autho controller for logout service

  @override
  Widget build(BuildContext context) {
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
      body: const AboutMeTemplate(
        aboutMeText:
            "I know I can help your company create stunning visuals. As someone who has worked in marketing and graphic design for over a decade, I know what brands need to capture their audiences' attention. With my pow…. read more",
        name: 'Ayesha Vassilieva',
        jobTitle: 'Senior Designer',
        profileImageUrl:
            'https://images.unsplash.com/photo-1573165850883-9b0e18c44bd2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHByb2Zlc3Npb25hbCUyMHdvbWFufGVufDB8fDB8fHww',
        mobilePhone: '123 456 7890',
        emailAddress: 'ayesha@mail.com',
        address: 'Los Angeles, CA',
        skills: [
          "Problem solving",
          "Technical skill",
          "Android",
          "IOS",
          "Design",
          "Website",
          "Mobile"
        ],
        profileComplete: 80,
      ),
    );
  }
}
