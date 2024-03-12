// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/functionality/job/apply/savedCard.dart';
import 'package:dienstleisto/frontend/screens/home/filter.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

class Tab01 extends StatefulWidget {
  const Tab01({super.key});

  @override
  _Tab01State createState() => _Tab01State();
}

class _Tab01State extends State<Tab01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Recent Posts",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CardSlider(
                items: [
                  CardItem(
                    profileImage: "assets/images/image.jpg",
                    profileTitle: 'Reduso Company',
                    jobTitle: 'Electrical Engineeer',
                    location: '7363 California, USA',
                    payment: "9K/mo",
                    time: '1hour ago',
                    onBookmarkTap: () {
                      // Handle bookmark tap here
                    },
                  ),
                  CardItem(
                    profileImage: "assets/images/image.jpg",
                    profileTitle: 'Future Insight Technology',
                    jobTitle: 'Project Manager',
                    location: '7363 California, USA',
                    payment: "9K/mo",
                    time: '3hour ago',
                    onBookmarkTap: () {
                      // Handle bookmark tap here
                    },
                  ),

                  // Add more CardItem here if needed
                ],
                backgroundColor: Theme.of(context).colorScheme.background,
                showShadow: false,
                borderRadius: 10.0,
              ),
              const SizedBox(
                height: 20,
              ),
              //Filter Box:
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // 1. Dropdown menu
                    DropdownButton<String>(
                      value: 'Best Match',
                      items: <String>['Best Match', 'Option 2', 'Option 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: MyText(
                            text: value,
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontFamily: "ABeeZee",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        );
                      }).toList(),
                      onChanged: (_) {
                        // Handle dropdown change here
                      },
                    ),

                    // 2. Sort action
                    Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.sort,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          size: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              // Handle sort action here
                            },
                            child: MyText(
                              text: 'Sort',
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontFamily: "ABeeZee",
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),

                    // 3. Filter section
                    Row(
                      children: <Widget>[
                        FaIcon(
                          FontAwesomeIcons.filter,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          size: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: const Filter(),
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: MyText(
                            text: 'Filter',
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontFamily: "ABeeZee",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //Service Box: for Book mark
              const Column(
                children: <Widget>[
                  SavedJobCard(
                    jobTitle: 'Product Designer',
                    companyName: 'Creatio Studio',
                    jobType: 'Fulltime',
                    payment: '8',
                    profileImagePath: 'assets/images/profileimage.jpg',
                  ),
                  SavedJobCard(
                    jobTitle: 'Finance Manager',
                    companyName: 'Complex Studio',
                    jobType: 'Remote',
                    payment: '5',
                    profileImagePath: 'assets/images/profileimage.jpg',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
