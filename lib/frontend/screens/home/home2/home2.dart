// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/home/home2/category.dart';
import 'package:dienstleisto/frontend/screens/home/search.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/cardSliderjonFeatured.dart';
import 'package:dienstleisto/frontend/widgets/categoriesCard.dart';
import 'package:dienstleisto/frontend/widgets/home2JobCard.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BrowserTwo extends StatefulWidget {
  const BrowserTwo({super.key});

  @override
  _BrowserTwoState createState() => _BrowserTwoState();
}

class _BrowserTwoState extends State<BrowserTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20,
                  ),
                  MyText(
                    text: 'San Francisco',
                    fontFamily: "ABeeZee",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    // Replace with actual location name
                  ),
                ],
              ),
              TextField(
                readOnly: true,
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
                  suffixIcon: IconButton(
                    onPressed: () {
                      //logic for pressing this icons
                    },
                    icon: Icon(
                      Icons.mic,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.background,
                  hintText: 'Search for everything...',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 15,
                  ),
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    letterSpacing: 0.5,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Theme.of(context).colorScheme.secondary,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: MyText(
                                      text: '17',
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ABeeZee",
                                      fontStyle: FontStyle.normal,
                                      textAlign: TextAlign.left,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.more_vert,
                                        color: Colors.white),
                                    onPressed: () {
                                      // handle button press
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: MyText(
                                  text: 'Job Applied',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  textAlign: TextAlign.left,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue.shade300,
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: MyText(
                                      text: '5',
                                      fontSize: 34,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "ABeeZee",
                                      fontStyle: FontStyle.normal,
                                      textAlign: TextAlign.left,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      // handle button press
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, right: 8.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: MyText(
                                  text: 'Interviews',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  textAlign: TextAlign.left,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Categories",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const Category(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
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

              CardSliderCategory(
                items: [
                  CardItemCategoryHome(
                    categoryTitle: 'Technology',
                    icon: Icons.computer,
                    onTap: () {},
                  ),
                  CardItemCategoryHome(
                    categoryTitle: 'Design & Art',
                    icon: Icons.brush,
                    onTap: () {},
                  ),
                  CardItemCategoryHome(
                    categoryTitle: 'Accounting',
                    icon: Icons.account_balance,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Home2JobCard(
                title: 'Flutter Developer',
                subTitle: 'Creater Studio',
                jobType: 'Full Time',
                progress: 50,
                imageUrl:
                    "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Top Companies",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const Category(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
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

              //card Slider
              CardSlider2Home(
                items: [
                  CardItemFeatureJob(
                    description: "87 jobs",
                    location: "Los Angeles, CA",
                    profileImage:
                        "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    profileTitle: 'Best Studio',
                  ),
                  CardItemFeatureJob(
                    description: "27 jobs",
                    location: "San Diego, CA",
                    profileImage:
                        "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    profileTitle: 'Doble Zero',
                  ),
                  CardItemFeatureJob(
                    description: "27 jobs",
                    location: "San Diego, CA",
                    profileImage:
                        "https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1985&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    profileTitle: 'Doble Zero',
                  ),
                ],
              ),
              //Feature Jobs title:
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Featured Jobs",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const Category(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
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
              // feature Cards
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
              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
