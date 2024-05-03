// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/Profile/ChooseInterests.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild.dart';
import 'package:dienstleisto/constants/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class JobPreference extends StatefulWidget {
  const JobPreference({super.key});

  @override
  _JobPreferenceState createState() => _JobPreferenceState();
}

class _JobPreferenceState extends State<JobPreference> {
  final TextEditingController _jobcategory = TextEditingController();
  final TextEditingController _payDayController = TextEditingController();
  final TextEditingController _minAmountController = TextEditingController();
  final TextEditingController _maxAmountController = TextEditingController();

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
          text: 'job Preferences',
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
                currentStep: 4,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Job Categories",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Enter Job Categories",
                controller: _jobcategory,
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
                  text: "Pay Day",
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              CustomTextField(
                hintText: "Once a Month",
                controller: _payDayController,
                hintColor: Colors.grey,
                fillColor: const Color.fromRGBO(239, 239, 244, 1),
                enableOnlyNumbers: false,
                enableDate: true,
              ),
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
                            text: "Min ",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Amount",
                          controller: _minAmountController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                          enableDropdown: false,
                          enableOnlyNumbers: true,
                          enableDate: false,
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
                            text: "Max",
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        CustomTextField(
                          hintText: "Amount",
                          controller: _maxAmountController,
                          hintColor: Colors.grey,
                          fillColor: const Color.fromRGBO(239, 239, 244, 1),
                          enableDropdown: false,
                          enableOnlyNumbers: true,
                          enableDate: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.30,
              ),
              CustomButton(
                onPressed: () {
                  if (_jobcategory.text.isEmpty ||
                      _maxAmountController.text.isEmpty ||
                      _minAmountController.text.isEmpty ||
                      _payDayController.text.isEmpty) {
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
                        child: const ChooseInterests(),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  }
                },
                text: "Done",
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
