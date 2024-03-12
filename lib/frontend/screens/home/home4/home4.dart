// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/widgets/BigImagePreview.dart';
import 'package:dienstleisto/frontend/widgets/SlidingCards.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/hone3ResetPost.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home4 extends StatefulWidget {
  const Home4({super.key});

  @override
  _Home4State createState() => _Home4State();
}

class _Home4State extends State<Home4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      color: Theme.of(context).colorScheme.background,
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_pin,
                              color: Colors.red,
                            ),
                            SizedBox(width: 10),
                            MyText(
                              text: 'San Francisco, California',
                              fontSize: 13,
                              fontFamily: "ABeeZee",
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () {
                      // Handle search icon tap here
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ProfileCardSlider(
                cards: [
                  ProfileCard(
                    backgroundImage:
                        'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    profileImage:
                        'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    companyName: "Best Studio",
                    title: 'Virtual Design Assistant',
                    location: 'Paris, France  ',
                    price: '80 -120/hr',
                    type: 'Full Time',
                  ),
                  ProfileCard(
                    backgroundImage: 'https://example.com/background2.jpg',
                    profileImage: 'https://example.com/profile2.jpg',
                    companyName: 'Company Name 2',
                    title: 'Title 2',
                    location: 'Location 2',
                    price: '80- 120/hr',
                    type: 'Full Time',
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Categories",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MyText(
                      text: "See all",
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const SlidingCards(
                itemCount: 5,
                icons: [
                  FontAwesomeIcons.paintbrush,
                  FontAwesomeIcons.briefcase,
                  FontAwesomeIcons.code,
                  FontAwesomeIcons.medkit,
                  FontAwesomeIcons.fireExtinguisher
                ],
                categories: [
                  'Art & Deaign',
                  'Business & Finance',
                  'Developer',
                  "Health & Fitness",
                  "Safety & Security"
                ],
                jobs: [
                  '150 Jobs',
                  '837 Jobs',
                  '328 jobs',
                  '199 Jobs',
                  "700 Jobs"
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Featured Jobs",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MyText(
                      text: "See all",
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Recent Posts",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MyText(
                      text: "See all",
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ProfileList(
                items: [
                  ProfileItem(
                    profileImage:
                        'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    profileTitle: 'Reduso Company',
                    jobTitle: 'Electrical Engineeer',
                    location: '7363 California, USA',
                    payment: "9K/mo",
                    time: '1hour ago',
                    onBookmarkTap: () {
                      // Handle bookmark tap here
                    },
                  ),
                  ProfileItem(
                    profileImage:
                        'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
