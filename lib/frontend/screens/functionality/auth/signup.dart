// ignore_for_file: camel_case_types

import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class signUp extends StatefulWidget {
  signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController country = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  bool _isChecked = false;
  String? selectedCountry;
  String? selectedCity;

  final List<String> countries = ['USA', 'Canada', 'Mexico'];
  final List<String> cities = ['New York', 'Toronto', 'Mexico City'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: <Widget>[
                //Image
                const Align(
                  alignment: Alignment.center,
                  //image for logo
                  // Image.asset(""),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Join Diensleisto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Make the most of your professional life",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                //row selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 60, // Set the height of the button
                      width: MediaQuery.of(context).size.width *
                          0.45, // Set the width to 45% of the screen width
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press for 'Customer'
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Customer'),
                      ),
                    ),
                    Container(
                      height: 60, // Set the height of the button
                      width: MediaQuery.of(context).size.width *
                          0.45, // Set the width to 45% of the screen width
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press for 'Service Seller'
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0, // No shadow
                        ),
                        child: const Text('Service Seller'),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // CustomTextField(
                    //   hintText: "First Name",
                    //   controller: firstName,
                    //   padding: const EdgeInsets.only(left: 12, right: 12),
                    // ),
                  ],
                ),
                const SizedBox(height: 15),
                //first Name
                CustomTextField(
                  hintText: "First Name",
                  controller: firstName,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                const SizedBox(height: 10),
                //last Name
                CustomTextField(
                  hintText: "Last Name",
                  controller: lastName,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                const SizedBox(height: 10),
                //username
                CustomTextField(
                  hintText: "User Name",
                  controller: username,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                const SizedBox(height: 10),

                //email
                CustomTextField(
                  hintText: "Email",
                  controller: email,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                const SizedBox(height: 10),
                //phone number
                CustomTextField(
                  hintText: "Telephone",
                  controller: phoneNumber,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  enableOnlyNumbers: true,
                ),
                const SizedBox(height: 10),

                // Rown two selector
                // country & City
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            hintText: 'Select Country',
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountry = newValue!;
                            });
                          },
                          items: countries
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey,
                            hintText: 'Select City',
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          value: selectedCity,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCity = newValue!;
                            });
                          },
                          items: cities
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                //address
                CustomTextField(
                  hintText: "Adress",
                  controller: address,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                ),
                const SizedBox(height: 10),
                //password
                CustomTextField(
                  hintText: "Password",
                  controller: password,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                //confirm password
                CustomTextField(
                  hintText: "Confirm Password",
                  controller: confirmPassword,
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  obscureText: true,
                ),
                const SizedBox(height: 5),
                //check box wit confirm password
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Row(
                    children: <Widget>[
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.black;
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
                            borderRadius:
                                BorderRadius.circular(10), // Rounded corners
                          ),
                        ),
                      ),
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize:
                              16, // You can adjust the font size to match the size of the checkbox
                        ),
                      ),
                    ],
                  ),
                ),

                //two button
                //register

                CustomButton(
                  onPressed: () {},
                  text: "Regiser",
                  enableIcon: false,
                  padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  height: 10,
                ),
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
                //google register
                CustomButton(
                  onPressed: () {},
                  text: "Google",
                  enableIcon: true,
                  icon: FontAwesomeIcons.google,
                ),
                const SizedBox(
                  height: 10,
                ),
                // text for login or already have account
                Padding(
                  padding: const EdgeInsets.only(left: 90.0, right: 90.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Already on Diensleisto?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => signUp()),
                          );
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
