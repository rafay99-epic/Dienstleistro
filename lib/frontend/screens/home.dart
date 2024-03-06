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
            // Image.asset(
            //   '', // Replace with your logo asset
            //   fit: BoxFit.contain,
            //   height: 32,
            // ),
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
                  value: 'Login',
                  child: Text('Login'),
                ),
                const PopupMenuItem<String>(
                  value: 'Sign Up',
                  child: Text('Sign Up'),
                ),
              ],
              onSelected: (String newValue) {
                switch (newValue) {
                  case 'Login':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                    break;
                  case 'Sign Up':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => signUp()),
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

                  //Stories
                  // Expanded(
                  //   child: StoryView(
                  //     controller: controller,
                  //     onComplete: () {
                  //       // Go back to the previous page when the stories are complete
                  //       Navigator.pop(context);
                  //     },
                  //     storyItems: [
                  //       StoryItem.text(
                  //           title: 'Hello world!',
                  //           backgroundColor: Colors.black),
                  //       StoryItem.pageImage(url: '', controller: controller),
                  //       StoryItem.pageVideo('https://example.com/video1.mp4',
                  //           controller: controller),
                  //     ],
                  //   ),
                  // ),
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
