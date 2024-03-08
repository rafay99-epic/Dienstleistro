// ignore_for_file: use_build_context_synchronously

import 'package:dienstleisto/frontend/screens/functionality/job/savedCard.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Find your dream jon in',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.background,
                                fontStyle: FontStyle.italic,
                                fontFamily: "ABeeZee",
                              ),
                            ),
                            TextSpan(
                              text: '\nSan Francisco',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.background,
                                fontStyle: FontStyle.italic,
                                fontFamily: "ABeeZee",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        hintText: 'Search for everthing...',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
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
                            // Handle filter action here
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
            ),
            const SizedBox(
              height: 10,
            ),
            //Service Box: for Book mark
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
