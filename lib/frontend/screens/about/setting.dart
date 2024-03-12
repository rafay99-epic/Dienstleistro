// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:dienstleisto/backend/auth/auth_service.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isNewsletterEnabled = false;
  bool isTextMessagesEnabled = false;
  bool isPhoneCallsEnabled = false;

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Settings",
                  fontSize: 34,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Account",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                // Change Password
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.lock_rounded,
                      color: Theme.of(context).colorScheme.background,
                      size: 18,
                    ),
                  ),
                  title: MyText(
                    text: 'Change Password',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "ABeeZee",
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 14,
                  ),
                  onTap: () {
                    // Handle privacy policy tap
                  },
                ),
                // Change Notifcation
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.background,
                      size: 18,
                    ),
                  ),
                  title: MyText(
                    text: 'Notification',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "ABeeZee",
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 14,
                  ),
                  onTap: () {
                    // Handle privacy policy tap
                  },
                ),
                // Notification
                ListTile(
                  leading: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.privacy_tip,
                      color: Theme.of(context).colorScheme.background,
                      size: 18,
                    ),
                  ),
                  title: MyText(
                    text: 'Privacy Settings',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "ABeeZee",
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 14,
                  ),
                  onTap: () {
                    // Handle notification tap
                  },
                ),
                // Privacy Policy
                ListTile(
                  leading: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Icon(
                      Icons.logout_rounded,
                      color: Theme.of(context).colorScheme.background,
                      size: 18,
                    ),
                  ),
                  title: MyText(
                    text: 'Sign Out',
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "ABeeZee",
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    size: 14,
                  ),
                  onTap: () async {
                    await _authService.signOut();
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
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "More Options",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText(
                        text: 'Newsletter',
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      Switch(
                        value: isNewsletterEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            isNewsletterEnabled = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText(
                        text: 'Text Messages',
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      Switch(
                        value: isTextMessagesEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            isTextMessagesEnabled = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MyText(
                        text: 'Phone Calls',
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      Switch(
                        value: isPhoneCallsEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            isPhoneCallsEnabled = value;
                          });
                        },
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: MyText(
                      text: 'Currency',
                      fontFamily: "ABeeZee",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 14,
                    ),
                    onTap: () {
                      // Handle currency tap
                    },
                  ),
                  ListTile(
                    title: MyText(
                      text: 'Languages',
                      fontFamily: "ABeeZee",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 14,
                    ),
                    onTap: () {
                      // Handle languages tap
                    },
                  ),
                  ListTile(
                    title: MyText(
                      text: 'Linked Accounts',
                      fontFamily: "ABeeZee",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      size: 14,
                    ),
                    onTap: () {
                      // Handle linked accounts tap
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
