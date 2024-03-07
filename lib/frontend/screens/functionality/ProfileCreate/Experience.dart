// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/functionality/ProfileCreate/JobPreference.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/oneradio.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:dienstleisto/frontend/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  _ExperienceState createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

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
          text: 'Experience',
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
                currentStep: 3,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Job Title",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter Job Title",
                controller: _jobTitleController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                enableDropdown: false,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Company",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter Company Name ",
                controller: _companyNameController,
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
                  text: "Location",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter company Location",
                controller: _locationController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const OneCustomRadioButton(),
              SizedBox(
                height: size.height * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Start Date",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "DD/MM/YYYY",
                          controller: _startDateController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                          enableDropdown: false,
                          enableOnlyNumbers: false,
                          enableDate: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02, // Adjust the width as needed
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "End Date",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "DD/MM/YYYY",
                          controller: _endDateController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                          enableDropdown: false,
                          enableOnlyNumbers: false,
                          enableDate: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
              CustomButton(
                onPressed: () {
                  if (_companyNameController.text.isEmpty ||
                      _endDateController.text.isEmpty ||
                      _jobTitleController.text.isEmpty ||
                      _startDateController.text.isEmpty ||
                      _locationController.text.isEmpty) {
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
                          "Please Enter all feild!",
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
                        child: const JobPreference(),
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
