// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  // current Step
  int _currentStep = 0;

  //continue Step
  continueStep() {
    if (_currentStep > 4) {
      setState(
        () {
          _currentStep = _currentStep + 1;
        },
      );
    }
  }

  //cancel Step:
  cancelStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep = _currentStep - 1;
      });
    }
  }

  //step Startep
  onStepState(int value) {
    setState(() {
      _currentStep = value;
    });
  }

  //button customize
  // Widget controlbuilder(contex, details) {
  //   return Row(
  //     children: <Widget>[
  //       CustomButton(
  //         onPressed: details.onStepContinue,
  //         text: "Continue",
  //         enableIcon: false,
  //         buttonTextColor: Theme.of(context).colorScheme.background,
  //         buttonTextSize: 17,
  //         buttonTextAlign: TextAlign.center,
  //         buttonTextFontFamily: "ABeeZee",
  //         buttonTextfontStyle: FontStyle.italic,
  //       )
  //     ],
  //   );
  // }
  Widget controlbuilder(BuildContext context, ControlsDetails details) {
    return Row(
      children: <Widget>[
        CustomButton(
          onPressed: details.onStepContinue!,
          text: "Continue",
          enableIcon: false,
          buttonTextColor: Theme.of(context).colorScheme.background,
          buttonTextSize: 17,
          buttonTextAlign: TextAlign.center,
          buttonTextFontFamily: "ABeeZee",
          buttonTextfontStyle: FontStyle.italic,
        ),
        const SizedBox(width: 10), // Add some space between the buttons
      ],
    );
  }
  //Controllers for text feild

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
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
          text: 'Personal Information',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stepper(
                elevation: 0,
                type: StepperType.horizontal,
                currentStep: _currentStep,
                onStepCancel: cancelStep,
                onStepContinue: continueStep,
                onStepTapped: onStepState,
                controlsBuilder: controlbuilder,
                steps: [
                  Step(
                    title: const MyText(text: ""),
                    content: Column(
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Name",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Name",
                          controller: _nameController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Phone",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Phone",
                          controller: _phoneController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                          enableOnlyNumbers: true,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Email",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Email",
                          controller: _emailController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Gender",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Gender",
                          controller: _genderController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                            text: "Date of Birth",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "DD/MM/YYY",
                          controller: _dateOfBirthController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                        ),
                      ],
                    ),
                  ),
                  const Step(
                    title: MyText(text: "Location"),
                    content: Column(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
