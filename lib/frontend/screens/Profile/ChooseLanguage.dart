// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/Profile/PersonalInformation.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/radio.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String? selectedRadio;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15, width: size.width * 0.5),
              const Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage('URL_OF_THE_IMAGE'),
                  child: Icon(Icons.camera_alt),
                ),
              ),
              const SizedBox(height: 20),
              //Hi Message
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: 'Hi, Brooklyn',
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                  fontFamily: "ABeeZee",
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text:
                      "Please select your preferred language to facilitate communication",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              //Choose Language radio button
              Row(
                children: <Widget>[
                  CustomRadioButton(
                    radioName: 'English',
                    selectedValue: selectedRadio == 'English',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'English';
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.1),
                  CustomRadioButton(
                    radioName: 'Chinese',
                    selectedValue: selectedRadio == 'Chinese',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Chinese';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: <Widget>[
                  CustomRadioButton(
                    radioName: 'Portuguese',
                    selectedValue: selectedRadio == 'Portuguese',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Portuguese';
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.1),
                  CustomRadioButton(
                    radioName: 'Spanish',
                    selectedValue: selectedRadio == 'Spanish',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Spanish';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: <Widget>[
                  CustomRadioButton(
                    radioName: 'Hindi',
                    selectedValue: selectedRadio == 'Hindi',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Hindi';
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.05),
                  CustomRadioButton(
                    radioName: 'Arabic',
                    selectedValue: selectedRadio == 'Arabic',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Arabic';
                      });
                    },
                  ),
                  SizedBox(width: size.width * 0.05),
                  CustomRadioButton(
                    radioName: 'Russian',
                    selectedValue: selectedRadio == 'Russian',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Russian';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.015),

              Row(
                children: <Widget>[
                  CustomRadioButton(
                    radioName: 'Bulgarian',
                    selectedValue: selectedRadio == 'Bulgarian',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Bulgarian';
                      });
                    },
                  ),
                  const SizedBox(width: 30),
                  CustomRadioButton(
                    radioName: 'Lithuanian',
                    selectedValue: selectedRadio == 'Lithuanian',
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = 'Lithuanian';
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.1, width: size.width * 0.5),
              //seleect buttons
              CustomButton(
                onPressed: () {
                  if (selectedRadio == null) {
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
                          "Please select a language to continue!",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  } else {
                    // Handle the button press

                    //change application language

                    //use shared perferance to store into device

                    //naviagate to different page
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const PersonalInformation(),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                text: "Select",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: 17,
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
