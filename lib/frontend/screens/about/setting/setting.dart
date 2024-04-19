// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

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

  Widget buildListTile(IconData icon, String text, void Function()? onTap) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.background,
          size: 18,
        ),
      ),
      title: MyText(
        text: text,
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
      onTap: onTap,
    );
  }

  Widget buildPadding(String text, {double fontsize = 17.0}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: MyText(
          text: text,
          fontSize: fontsize,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.left,
          fontStyle: FontStyle.italic,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget buildRow(String text, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        MyText(
          text: text,
          fontFamily: "ABeeZee",
          color: Theme.of(context).colorScheme.primary,
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Colors.green,
          inactiveThumbColor: Colors.grey,
        ),
      ],
    );
  }

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
            buildPadding("Settings", fontsize: 34),
            const SizedBox(height: 15),
            buildPadding("Account"),
            Column(
              children: <Widget>[
                buildListTile(Icons.lock_rounded, 'Change Password', () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.leftToRightWithFade,
                      child: ChangePassword(),
                    ),
                  );
                }),
                buildListTile(Icons.notifications, 'Notification', () {
                  // Handle privacy policy tap
                }),
                buildListTile(Icons.privacy_tip, 'Privacy Settings', () {
                  // Handle notification tap
                }),
                buildListTile(Icons.logout_rounded, 'Sign Out', () async {
                  logout(context);
                  // Handle logout tap
                }),
                buildListTile(Icons.logout_rounded, 'Currency', () async {
                  // Handle logout tap
                }),
                buildListTile(Icons.language, 'Languages', () async {
                  // Handle logout tap
                }),
                buildListTile(Icons.link, 'Linked Accounts', () async {
                  // Handle logout tap
                }),
              ],
            ),
            const SizedBox(height: 15),
            buildPadding("More Options"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  buildRow('Newsletter', isNewsletterEnabled, (bool value) {
                    setState(() {
                      isNewsletterEnabled = value;
                    });
                  }),
                  buildRow('Text Messages', isTextMessagesEnabled,
                      (bool value) {
                    setState(() {
                      isTextMessagesEnabled = value;
                    });
                  }),
                  buildRow('Phone Calls', isPhoneCallsEnabled, (bool value) {
                    setState(() {
                      isPhoneCallsEnabled = value;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void logout(BuildContext context) async {
  final Authentication _auth = Authentication();
  try {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    String email = userProvider.email;
    bool isLoggedOut = await _auth.logoutAPI(email, context);
    if (isLoggedOut) {
      userProvider.clear();
      Navigator.of(context).pushAndRemoveUntil(
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: const login(),
          duration: const Duration(milliseconds: 500),
        ),
        (Route<dynamic> route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 10,
          duration: const Duration(seconds: 4),
          backgroundColor: Theme.of(context).colorScheme.secondary,
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
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
}
