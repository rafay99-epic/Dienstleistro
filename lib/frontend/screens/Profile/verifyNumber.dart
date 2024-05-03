// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:dienstleisto/frontend/screens/Profile/setLocation.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class VerifyNumber extends StatefulWidget {
  VerifyNumber({super.key});

  @override
  _VerifyNumberState createState() => _VerifyNumberState();
  final TextEditingController _emailforgetpassword = TextEditingController();
}

class _VerifyNumberState extends State<VerifyNumber> {
  Timer? _timer;
  int _start = 90;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _isButtonDisabled = true;
    _start = 90;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
            _isButtonDisabled = false;
          } else {
            _start--;
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: size.width * 0.02,
        toolbarHeight: size.height * 0.1,
        centerTitle: true,
        leading: null,
        title: MyText(
          text: 'Verifying Number',
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
                text: "We've sent your verfication code",
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.04,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: size.height * 0.05),
              CustomTextField(
                hintText: "Enter Code",
                controller: widget._emailforgetpassword,
                enableOnlyNumbers: false,
                obscureText: false,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              SizedBox(height: size.height * 0.03),
              CustomButton(
                onPressed: () {
                  //logic for verify code from firebase

                  //once verified then add data into the database

                  // then redirect to the next page. which is access location.
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const SetLocation(),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
                },
                text: "Verify",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: size.width * 0.04, // 4% of screen width
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _isButtonDisabled ? null : startTimer,
                    child: MyText(
                      text: 'Resend Code',
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  MyText(
                    text: "$_start  seconds left",
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
