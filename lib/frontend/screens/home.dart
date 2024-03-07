// ignore_for_file: use_build_context_synchronously

import 'package:dienstleisto/backend/auth/auth_service.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';
import 'package:dienstleisto/frontend/screens/functionality/services/servicesOffer/action.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  String dropdownValue = 'Account';
  final StoryController controller = StoryController();
  late List<StoryItem> storyItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue.shade400,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Dinesleisto',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton<String>(
              iconColor: Colors.white,
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
                const PopupMenuItem<String>(
                  value: 'Sign Up',
                  child: Text('Sign Up'),
                ),
              ],
              onSelected: (String newValue) {
                switch (newValue) {
                  case 'Logout':
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            'Confirm Logout',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: const Text(
                            'Do you want to log out?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.background,
                                ),
                                child: const Text(
                                  'No',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.background,
                                  backgroundColor:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                  await _authService.signOut();

                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: const login(),
                                      duration:
                                          const Duration(milliseconds: 500),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    break;
                  case 'Sign Up':
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: const signUp(),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                    break;
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Colors.blue.shade400,
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Get the Perfect Workers & Projects",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Within the world's #1 Service marketplace",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        suffix: const VerticalDivider(color: Colors.black),
                        prefixIcon: const Icon(Icons.filter_list),
                        prefix: const VerticalDivider(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search Here',
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
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 12.0, right: 12.0), // Add left padding
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Services",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  CardSlider(
                    items: [
                      CardItem(
                        item: Image.network(
                            'https://plus.unsplash.com/premium_photo-1682145927654-1913ccba955e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your image
                        title: 'Interior Design',
                        location: 'Berline',
                        initialRating: 3.0,
                        subscriptionText: 'Subscription',
                        buttonText: 'View',
                        onCardTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: const services_action(),
                            ),
                          );
                        },
                        onButtonTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeftWithFade,
                              child: const services_action(),
                            ),
                          );
                        },
                      ),
                      CardItem(
                        item: Image.network(
                            'https://plus.unsplash.com/premium_photo-1682145927654-1913ccba955e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your image
                        title: 'Interior Design',
                        location: 'Berline',
                        initialRating: 3.0,
                        subscriptionText: 'Subscription',
                        buttonText: 'View',
                        onCardTap: () {
                          print('Card tapped!');
                        },
                        onButtonTap: () {
                          print('Button tapped!');
                        },
                      ),
                      // Add more CardItem objects if needed
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Text for Stories
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                    ), // Add left padding
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Stories",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 300,
                    child: StoryView(
                      controller: controller,
                      onComplete: () {
                        // Go back to the previous page when the stories are complete
                        Navigator.pop(context);
                      },
                      storyItems: [
                        StoryItem.text(
                            title: 'Hello world!',
                            backgroundColor: Colors.black),
                        StoryItem.pageImage(url: '', controller: controller),
                        StoryItem.pageVideo(
                          '',
                          controller: controller,
                        ),
                      ],
                    ),
                  ),
                  // const VideoSlider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
