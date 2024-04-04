// ignore_for_file: dead_code

import 'package:csc_picker/csc_picker.dart';
import 'package:dienstleisto/backend/api/auth/auth_api.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({super.key});

  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController adress = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  bool _rememberMe = false;
  final Authentication _auth = Authentication();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    firstname.dispose();
    lastname.dispose();
    username.dispose();
    email.dispose();
    adress.dispose();
    password.dispose();
    confirmPassword.dispose();
    phoneNumber.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          CustomTextField(
            hintText: "First Name",
            controller: firstname,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Last Name",
            controller: lastname,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "User Name",
            controller: username,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Email",
            controller: email,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Phone Number",
            controller: phoneNumber,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CSCPicker(
            ///Enable disable state dropdown [OPTIONAL PARAMETER]
            showStates: true,

            /// Enable disable city drop down [OPTIONAL PARAMETER]
            showCities: true,

            ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
            flagState: CountryFlag.ENABLE,

            ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
            dropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),

            ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
            disabledDropdownDecoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.grey.shade300, width: 1),
            ),

            countrySearchPlaceholder: countryController.text,
            stateSearchPlaceholder: stateController.text,
            citySearchPlaceholder: cityController.text,

            countryDropdownLabel: "*Country",
            stateDropdownLabel: "*State",
            cityDropdownLabel: "*City",

            ///selected item style [OPTIONAL PARAMETER]
            selectedItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///DropdownDialog Heading style [OPTIONAL PARAMETER]
            dropdownHeadingStyle: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

            ///DropdownDialog Item style [OPTIONAL PARAMETER]
            dropdownItemStyle: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),

            ///Dialog box radius [OPTIONAL PARAMETER]
            dropdownDialogRadius: 10.0,

            ///Search bar radius [OPTIONAL PARAMETER]
            searchBarRadius: 10.0,

            ///triggers once country selected in dropdown
            onCountryChanged: (value) {
              setState(() {
                countryController.text = 'Country: $value';
              });
            },
            onStateChanged: (value) {
              setState(() {
                stateController.text = 'State: $value';
              });
            },
            onCityChanged: (value) {
              setState(() {
                cityController.text = 'City: $value';
              });
            },
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Adress",
            controller: adress,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Password",
            controller: password,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
            showPassword: true,
            obscureText: true,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Confirm Password",
            controller: confirmPassword,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
            showPassword: true,
            obscureText: true,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.green,
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(
                        _rememberMe
                            ? Icons.check
                            : Icons.check_box_outline_blank,
                        color: _rememberMe ? Colors.green : Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _rememberMe = !_rememberMe;
                      });
                    },
                  ),
                ),
              ),
              MyText(
                text: 'I agree to the terms and conditions',
                fontFamily: "ABeeZee",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
          const SizedBox(height: 15),
          CustomButton(
            onPressed: () async {
              // Check if all fields are filled out and password and confirm password fields match
              if (firstname.text.isNotEmpty &&
                  lastname.text.isNotEmpty &&
                  username.text.isNotEmpty &&
                  email.text.isNotEmpty &&
                  adress.text.isNotEmpty &&
                  password.text.isNotEmpty &&
                  confirmPassword.text.isNotEmpty &&
                  phoneNumber.text.isNotEmpty &&
                  countryController.text.isNotEmpty &&
                  stateController.text.isNotEmpty &&
                  cityController.text.isNotEmpty &&
                  password.text == confirmPassword.text) {
                // Get the UserProvider
                UserProvider userProvider =
                    Provider.of<UserProvider>(context, listen: false);

                // Set the values in the UserProvider
                userProvider.setRegisterFirstName(firstname.text);
                userProvider.setRegisterLastName(lastname.text);
                userProvider.setRegisterUsername(username.text);
                userProvider.setRegisterEmail(email.text);
                userProvider.setRegisterAddress(adress.text);
                userProvider.setRegisterPassword(password.text);
                userProvider.setRegisterPhoneNumber(phoneNumber.text);
                userProvider.setRegisterCountry(countryController.text);
                userProvider.setRegisterState(stateController.text);
                userProvider.setRegisterCity(cityController.text);
                userProvider.setRegisterConfirPassword(confirmPassword.text);

                // print("------------------------");
                // print('password: ${password.text}');
                // print('confirmPassword: ${confirmPassword.text}');
                // print("------------------------");

                // print("------------------------");
                // print('UserProvider password: ${userProvider.password}');
                // print('confirmPassword: ${userProvider.confirmPassword}');
                // print("------------------------");

                // Call the registerUser function and show a loading spinner while it's running
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return FutureBuilder<Map<String, dynamic>>(
                      future: _auth.registerUser(
                        name: userProvider.username,
                        email: userProvider.regiseremail,
                        password: userProvider.password,
                        role: 'Customer',
                        phone: userProvider.phoneNumber,
                        selectedCountryName: userProvider.country,
                        city: userProvider.city,
                        address: userProvider.address,
                        firstName: userProvider.firstName,
                        lastName: userProvider.lastName,
                        passwordConfirmation: userProvider.confirmPassword,
                        mode: 'manual',
                      ),
                      builder: (BuildContext context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return AlertDialog(
                            content: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                const SizedBox(width: 20),
                                Text(
                                  "Registering...",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontSize: 20,
                                    fontFamily: "ABeeZee",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          Navigator.of(context).pop();
                          if (snapshot.hasError) {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 10,
                                    duration: const Duration(seconds: 2),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    showCloseIcon: true,
                                    content: Text(
                                      "Error: ${snapshot.error}",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                            return const Text('An error occurred');
                          } else {
                            WidgetsBinding.instance.addPostFrameCallback(
                              (_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 10,
                                    duration: const Duration(seconds: 2),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    showCloseIcon: true,
                                    content: Text(
                                      snapshot.data?['success'] == true
                                          ? "User registered successfully, Please Verify your Account"
                                          : snapshot.data?['message'] ??
                                              "Unknown error",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );

                            // Clear the data from the provider and the controllers if the registration was successful
                            if (snapshot.data?['success'] == true) {
                              userProvider.clearUserData();
                              firstname.clear();
                              lastname.clear();
                              username.clear();
                              email.clear();
                              adress.clear();
                              phoneNumber.clear();
                              countryController.clear();
                              stateController.clear();
                              cityController.clear();
                              password.clear();
                              confirmPassword.clear();
                            }
                            return const SizedBox.shrink();
                          }
                        }
                      },
                    );
                  },
                );
              } else {
                // Show a snackbar to inform the user that all fields must be filled out and the passwords must match
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    elevation: 10,
                    duration: const Duration(seconds: 2),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    showCloseIcon: true,
                    content: Text(
                      "Please fill all the fields and ensure that the password and confirm password fields match.",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 15,
                      ),
                    ),
                  ),
                );
              }
            },
            text: "Agree to Join",
            enableIcon: false,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            buttonTextColor: Theme.of(context).colorScheme.background,
            buttonTextSize: 17,
            buttonTextAlign: TextAlign.center,
            buttonTextFontFamily: 'ABeeZee',
            buttonTextfontStyle: FontStyle.italic,
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "or",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomButton(
            onPressed: () async {
              //Sign up  with google Account
            },
            icon: FontAwesomeIcons.google,
            text: 'Sign up with Google',
            enableIcon: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            borderRadius: 10.0,
            buttonTextColor: Theme.of(context).colorScheme.primary,
            buttonTextSize: 17,
            buttonTextAlign: TextAlign.center,
            buttonTextFontFamily: 'ABeeZee',
            buttonTextfontStyle: FontStyle.italic,
            iconColor: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
