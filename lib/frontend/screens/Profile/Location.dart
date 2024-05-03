// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/Profile/Education.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:dienstleisto/constants/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LocationGet extends StatefulWidget {
  const LocationGet({super.key});

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<LocationGet> {
  //Text Controller
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _streetAdressController = TextEditingController();
  final TextEditingController _cityStateController = TextEditingController();
  final TextEditingController _pistalCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        title: MyText(
          text: 'Location',
          color: Theme.of(context).colorScheme.primary,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: size.width * 0.04,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Handle the save action
            },
            child: MyText(
              text: 'Save',
              fontFamily: "ABeeZee",
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
              ),
              Timeline(
                currentStep: 1,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Country",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter country",
                controller: _countryController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                enableDropdown: true,
                dropdownOptions: const ["US", "UK", "PK"],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Street Adress",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter street adress",
                controller: _streetAdressController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                enableOnlyNumbers: false,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "City, State",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter City, State",
                controller: _cityStateController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Postal Code",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter postal code",
                controller: _pistalCodeController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                enableDropdown: false,
                enableOnlyNumbers: true,
              ),
              SizedBox(
                height: size.height * 0.20,
              ),
              CustomButton(
                onPressed: () {
                  if (_cityStateController.text.isEmpty ||
                      _countryController.text.isEmpty ||
                      _pistalCodeController.text.isEmpty ||
                      _streetAdressController.text.isEmpty) {
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
                          "Please Enter all feilds to continue...",
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
                        child: const Education(),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                text: "Continue",
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
