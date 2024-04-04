// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:dienstleisto/backend/api/auth/auth_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/frontend/screens/auth/login/login.dart';
import 'package:dienstleisto/frontend/screens/Profile/setting/updatePassword/update_password.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool isNewsletterEnabled = false;
  bool isTextMessagesEnabled = false;
  bool isPhoneCallsEnabled = false;
  final Authentication _auth = Authentication();

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
                    Navigator.of(context).push(
                      PageTransition(
                        type: PageTransitionType.leftToRightWithFade,
                        child: ChangePassword(),
                      ),
                    );
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
                    try {
                      UserProvider userProvider =
                          Provider.of<UserProvider>(context, listen: false);
                      String email = userProvider.email;
                      bool isLoggedOut = await _auth.logoutAPI(email, context);
                      if (isLoggedOut) {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: const login(),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 10,
                            duration: const Duration(seconds: 2),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            showCloseIcon: true,
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Logout failed. Please try again.",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.background,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 10,
                          duration: const Duration(seconds: 2),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          showCloseIcon: true,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "'Failed to logout: $e'",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    }
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
