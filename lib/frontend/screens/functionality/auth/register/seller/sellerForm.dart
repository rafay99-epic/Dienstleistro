// ignore_for_file: dead_code

import 'package:csc_picker/csc_picker.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerForm extends StatefulWidget {
  const SellerForm({super.key});

  @override
  State<SellerForm> createState() => _SellerFormState();
}

class _SellerFormState extends State<SellerForm> {
  @override
  Widget build(BuildContext context) {
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
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: "Confirm Password",
            controller: confirmPassword,
            fillColor: const Color.fromRGBO(239, 239, 244, 1),
            hintColor: Colors.grey,
            showPassword: true,
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
            onPressed: () async {},
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
            onPressed: () async {},
            icon: FontAwesomeIcons.google,
            text: 'Sign in with Google',
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
