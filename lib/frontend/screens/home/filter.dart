// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:dienstleisto/frontend/widgets/choiceChip.dart';
import 'package:dienstleisto/frontend/widgets/jobtype.dart';
import 'package:dienstleisto/frontend/widgets/rating.dart';
import 'package:dienstleisto/frontend/widgets/scablecontainer.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: size.width * 0.02,
        toolbarHeight: size.height * 0.1,
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
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Handle the save action
            },
            child: MyText(
              text: 'Reset',
              fontFamily: "ABeeZee",
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Filter",
                  fontSize: 34,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.location_on, // Map location icon
                        color: Colors.red,
                      ),
                      MyText(
                        text: 'San Francisco, United States',
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.left,
                        // Replace with actual location name
                      ),
                      const Icon(
                        Icons.arrow_forward_ios, // Map arrow icon
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Discover Jobs Near you",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              FlutterSlider(
                values: const [0, 1000], // Initial value
                max: 1000,
                min: 0,
                handler: FlutterSliderHandler(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                ),
                trackBar: FlutterSliderTrackBar(
                  activeTrackBar: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary),
                ),
                tooltip: FlutterSliderTooltip(
                  textStyle: TextStyle(
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.primary),
                  boxStyle: FlutterSliderTooltipBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  // Display the value
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Job Type",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              CustomRadioList(
                options: const [
                  'Full Time',
                  'Part Time',
                  'Contract',
                  'Internship',
                  'Freelance'
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Categories",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              const SelectableContainer(
                options: [
                  'Development',
                  'Design & Art',
                  'Accounting',
                  'Marketing',
                  'Customer Service',
                  'Health & Care ',
                  'Human Resources',
                  'Automative Jobs'
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Salaty Range",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Experience Level",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Wrap(
                spacing: 4.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  CustomChoiceChip(label: 'Entry Level'),
                  CustomChoiceChip(label: 'Mid Level'),
                  CustomChoiceChip(label: 'Top Level'),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Company Rating",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 10),
              // company raiting
              const RatingWidget(),
              //apply button
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {},
                text: "Apply",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: 17,
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
