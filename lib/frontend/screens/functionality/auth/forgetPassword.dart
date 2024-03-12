// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/backend/auth/auth_service.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  ForgetPassword({super.key});

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
  final TextEditingController _emailforgetpassword = TextEditingController();
  final AuthService _authService = AuthService();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: size.width * 0.02, // 2% of screen width
        toolbarHeight: size.height * 0.1, // 10% of screen height
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.primary,
            )),
        title: MyText(
          text: 'Forget Password',
          color: Theme.of(context).colorScheme.primary,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: size.width * 0.04, // 4% of screen width
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              MyText(
                text:
                    "Enter your email and will send you instruction on how to reset it",
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.04, // 4% of screen width
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: size.height * 0.05), // 3% of screen height
              CustomTextField(
                hintText: "Email",
                controller: widget._emailforgetpassword,
                enableOnlyNumbers: false,
                obscureText: false,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              SizedBox(height: size.height * 0.03), // 3% of screen height
              CustomButton(
                onPressed: () {
                  //logic for sign In Button from firebase
                  widget._authService
                      .resetPassword(widget._emailforgetpassword.text);
                  //showing snak bar after reset.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 10,
                      duration: const Duration(seconds: 2),
                      width: size.width * 0.9,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      showCloseIcon: true,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Email has been sent to reset password. Check your email.",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                  widget._emailforgetpassword.clear();
                },
                text: "Send",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: size.width * 0.04, // 4% of screen width
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
