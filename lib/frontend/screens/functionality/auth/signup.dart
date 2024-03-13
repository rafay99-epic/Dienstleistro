// ignore_for_file: camel_case_types

import 'package:dienstleisto/frontend/screens/functionality/ProfileCreate/verifyNumber.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';

import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool _isChecked = false;
  File? _profileImage;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double imageSize = size.width * 0.2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.15, width: size.width * 0.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                              fontStyle: FontStyle.italic,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                          TextSpan(
                            text: '\nuser',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.primary,
                              fontStyle: FontStyle.italic,
                              fontFamily: "ABeeZee",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _profileImage = File(pickedFile.path);
                        });
                      }
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: imageSize,
                          height: imageSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: _profileImage != null
                                  ? FileImage(_profileImage!)
                                  : const AssetImage(
                                          'assets/images/profileimage.jpg')
                                      as ImageProvider<Object>,
                            ),
                          ),
                        ),
                        if (_profileImage == null)
                          Container(
                            width: imageSize,
                            height: imageSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: const Icon(Icons.camera_alt,
                                color: Colors.white),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 15),
              SizedBox(height: size.height * 0.02),

              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Sign up to join",
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              // const SizedBox(height: 15),
              SizedBox(height: size.height * 0.01),

              //first Name
              CustomTextField(
                hintText: "First Name",
                controller: name,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              // const SizedBox(height: 10),
              SizedBox(height: size.height * 0.01),

              //email
              CustomTextField(
                hintText: "Email",
                controller: email,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              // const SizedBox(height: 10),
              SizedBox(height: size.height * 0.01),

              //phone number
              // CustomTextField(
              //   hintText: "Telephone",
              //   controller: phoneNumber,
              //   enableOnlyNumbers: true,
              //   fillColor: const Color.fromRGBO(239, 239, 244, 1),
              //   hintColor: Colors.grey,
              // ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phoneNumber.text = number.phoneNumber ?? '';
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
              // const SizedBox(height: 10),
              SizedBox(height: size.height * 0.01),
              //password
              CustomTextField(
                hintText: "Password",
                controller: password,
                obscureText: true,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                hintColor: Colors.grey,
              ),
              // const SizedBox(height: 5),
              SizedBox(height: size.height * 0.01),

              //check box wit confirm password
              Row(
                children: <Widget>[
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      checkColor: Colors.white,
                      fillColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return Colors.green;
                        }
                        return Colors.white;
                      }),
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                        fontStyle: FontStyle.italic,
                      ),
                      children: const <TextSpan>[
                        TextSpan(text: 'I agree to the '),
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: size.height * 0.02),

              CustomButton(
                onPressed: () {
                  //logic for sign In Button from firebase

                  //check all the feild are filled that include.

                  if (name.text.isEmpty ||
                      email.text.isEmpty ||
                      phoneNumber.text.isEmpty ||
                      password.text.isEmpty) {
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
                          "Please fill all the feilds",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    );
                  } else {
                    //Verify phone number

                    //verify Screens
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: VerifyNumber(),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  }

                  //then add user into the firebase.
                },
                text: "Sign Up",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: 17,
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),

              // SizedBox(height: size.height * 0.1),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.13,
                  bottom: size.height * 0.1,
                  left: size.width * 0.16,
                  right: size.width * 0.16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      text: 'Have an account?',
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.normal,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: const login(),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: MyText(
                        text: ' Sign In',
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
