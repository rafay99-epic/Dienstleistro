// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/home/search.dart';

import 'package:dienstleisto/frontend/widgets/Jobcardtitel.dart';
import 'package:dienstleisto/frontend/widgets/TagRow.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/citycard.dart';
import 'package:dienstleisto/frontend/widgets/hone3ResetPost.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class Home3 extends StatefulWidget {
  const Home3({super.key});

  @override
  _Home3State createState() => _Home3State();
}

class _Home3State extends State<Home3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                readOnly:
                    true, // Make TextField read-only to ensure onTap is always triggered
                onTap: () {
                  // Handle tap event here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Search(),
                    ),
                  );
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  hintText: 'Search for everything...',
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
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: TagRow(
                tags: const [
                  "Developer",
                  "UX/UI Deigner",
                  "Project Manager",
                  "QA"
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
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
            ),
            const SizedBox(height: 10),
            // feature Cards
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: CardSlider(
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
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Popular Companies",
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
            ),
            const JobCardList(
              jobs: [
                {
                  'profileImage':
                      'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  'title': 'Best Studio',
                  'jobNumber': '329 Jobs',
                },
                {
                  'profileImage':
                      'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?q=80&w=1941&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  'title': 'Creative Studio',
                  'jobNumber': '196 Jobs',
                },
                // Add more jobs here...
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Featured Cities",
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
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: LocationCard(
                      backgroundImage:
                          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      country: 'France',
                      place: 'Paris',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: LocationCard(
                      backgroundImage:
                          "https://images.unsplash.com/photo-1562767332-ce0b1e2426bb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      country: 'UK',
                      place: 'London',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: LocationCard(
                      backgroundImage:
                          "https://plus.unsplash.com/premium_photo-1673639729701-c903b5d2be4b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      country: 'US',
                      place: 'New York',
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: LocationCard(
                      backgroundImage:
                          "https://images.unsplash.com/photo-1675958428291-ac8588eb1934?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                      country: 'Germany',
                      place: 'Berlin',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ProfileList(
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
            ),
          ],
        ),
      ),
    );
  }
}
