// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/home/navbar.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/choiceChip.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ChooseInterests extends StatefulWidget {
  const ChooseInterests({super.key});

  @override
  _ChooseInterestsState createState() => _ChooseInterestsState();
}

class _ChooseInterestsState extends State<ChooseInterests> {
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
            )),
        title: MyText(
          text: 'Choose Interests',
          color: Theme.of(context).colorScheme.primary,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: size.width * 0.04, // 4% of screen width
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
              MyText(
                text: "Choose 5 or more areas of interest you want to see",
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: size.width * 0.04, // 4% of screen width
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Wrap(
                spacing: 4.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  CustomChoiceChip(label: 'History'),
                  CustomChoiceChip(label: 'Support'),
                  CustomChoiceChip(label: 'Art'),
                  CustomChoiceChip(label: 'Entertainment'),
                  CustomChoiceChip(label: 'Outdoor'),
                  CustomChoiceChip(label: 'Music'),
                  CustomChoiceChip(label: 'Social'),
                  CustomChoiceChip(label: 'Nightlife'),
                  CustomChoiceChip(label: 'Concerts'),
                  CustomChoiceChip(label: 'Health'),
                  CustomChoiceChip(label: 'Submarine'),
                  CustomChoiceChip(label: 'Shopping'),
                  CustomChoiceChip(label: 'Adventure'),
                  CustomChoiceChip(label: 'Animals'),
                  CustomChoiceChip(label: 'Party'),
                  CustomChoiceChip(label: 'Nature'),
                  CustomChoiceChip(label: 'Design'),
                  CustomChoiceChip(label: 'Comedy'),
                  CustomChoiceChip(label: 'Dance'),
                  CustomChoiceChip(label: 'Gaming'),
                  CustomChoiceChip(label: 'Theater'),
                  CustomChoiceChip(label: 'Magic'),
                  CustomChoiceChip(label: 'Cooking'),
                  CustomChoiceChip(label: 'Hiking'),
                  CustomChoiceChip(label: 'Agriculture'),
                  CustomChoiceChip(label: 'Magic'),
                  CustomChoiceChip(label: 'Backpacking'),
                  CustomChoiceChip(label: 'Camping'),
                  CustomChoiceChip(label: 'Fashion'),
                ],
              ),
              SizedBox(
                height: size.height * 0.12,
              ),
              CustomButton(
                onPressed: () {
                  // Handle the button press

                  //change application language

                  //use shared perferance to store into device

                  //naviagate to different page
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      child: const Navbar(),
                      duration: const Duration(milliseconds: 500),
                    ),
                  );
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
