// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_unnecessary_containers

import 'package:dienstleisto/backend/api/auth/auth_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  final Authentication _auth = Authentication();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final currentPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Calling the Provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    //Calling the Provider and getting the email address
    final email = userProvider.email;
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
          text: 'Update Password',
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
                text: "Password Update",
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.04, // 4% of screen width
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: size.height * 0.05), // 3% of screen height
              CustomTextField(
                hintText: "Current Password",
                controller: currentPasswordController,
                enableOnlyNumbers: false,
                obscureText: true,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                hintText: "New  Password",
                controller: passwordController,
                enableOnlyNumbers: false,
                obscureText: true,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              SizedBox(height: size.height * 0.03),
              CustomTextField(
                hintText: "Re-Enter New  Password",
                controller: confirmPasswordController,
                enableOnlyNumbers: false,
                obscureText: true,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(
                onPressed: () async {
                  try {
                    if (currentPasswordController.text.isEmpty) {
                      throw Exception('Please enter your current password');
                    } else if (passwordController.text.isEmpty) {
                      throw Exception('Please enter a new password');
                    } else if (confirmPasswordController.text.isEmpty) {
                      throw Exception('Please confirm your new password');
                    } else if (passwordController.text !=
                        confirmPasswordController.text) {
                      throw Exception(
                          'New password and password confirmation do not match');
                    } else {
                      await _auth.updatePassword(
                        email,
                        currentPasswordController.text,
                        passwordController.text,
                        confirmPasswordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 10,
                          duration: const Duration(seconds: 2),
                          width: size.width * 0.9,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          showCloseIcon: true,
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Your Password has been updated successfully",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                      confirmPasswordController.clear();
                      passwordController.clear();
                      currentPasswordController.clear();
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        elevation: 10,
                        duration: const Duration(seconds: 2),
                        width: size.width * 0.9,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        showCloseIcon: true,
                        behavior: SnackBarBehavior.floating,
                        content: Text(
                          "Failed to reset password: $e",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  }
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
