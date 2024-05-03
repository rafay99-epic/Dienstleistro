// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/Profile/Location.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:dienstleisto/constants/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.01,
              ),
              Timeline(
                currentStep: 0,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
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
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  _phoneController.text = number.phoneNumber ?? '';
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.DROPDOWN,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                initialValue: PhoneNumber(isoCode: 'DE'),
                formatInput: false,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputDecoration: const InputDecoration(
                  fillColor: Color.fromRGBO(239, 239, 244, 1),
                  filled: true,
                  hintText: "Telephone",
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
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
                enableDropdown: true,
                dropdownOptions: const ["Male", "Female"],
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
                enableDate: true,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              CustomButton(
                onPressed: () {
                  if (_nameController.text.isEmpty ||
                      _emailController.text.isEmpty ||
                      _phoneController.text.isEmpty ||
                      _genderController.text.isEmpty ||
                      _dateOfBirthController.text.isEmpty) {
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
                        child: const LocationGet(),
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
