// ignore_for_file: camel_case_types

import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';
import 'package:dienstleisto/frontend/widgets/boxes.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class choosePage extends StatefulWidget {
  const choosePage({super.key});

  @override
  State<choosePage> createState() => _choosePageState();
}

class _choosePageState extends State<choosePage> {
  int? _selectedInkWell;
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Calculate the scale factor
    final scaleFactor = screenSize.height / 896;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 20.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30 * scaleFactor),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: "Continue as ",
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 40,
                    fontFamily: "ABeeZee",
                    textAlign: TextAlign.left,
                    fontStyle: FontStyle.italic,
                  )),
              SizedBox(height: 15 * scaleFactor),
              const Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text:
                        "To continue to next page, Please select which one you are",
                    fontFamily: "ABeeZee",
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    textAlign: TextAlign.left,
                    fontStyle: FontStyle.normal,
                  )),
              SizedBox(height: 45 * scaleFactor),
              CustomInkWell(
                icon: Icons.person,
                title: "Job Seeker",
                description: "Find your dream job and build your dream",
                selected: _selectedInkWell == 0,
                onTap: () {
                  setState(() {
                    _selectedInkWell = 0;
                  });
                },
              ),
              SizedBox(height: 15 * scaleFactor),
              CustomInkWell(
                icon: Icons.business_center,
                title: "Company",
                description: "Recruit the best talent and build your",
                selected: _selectedInkWell == 1,
                onTap: () {
                  setState(() {
                    _selectedInkWell = 1;
                  });
                },
              ),
              SizedBox(
                height: 230 * scaleFactor,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const login(), //! change the page redirect:
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: MyText(
                      text: 'Continue',
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 17,
                      textAlign: TextAlign.center,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
