import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Account';
  final controller = StoryController();

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
      body: Column(
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
            child: const Column(
              children: <Widget>[
                Padding(
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
                //Flutter Cards for services

                // Text for Stories
                Padding(
                  padding: EdgeInsets.only(
                      left: 12.0, right: 12.0), // Add left padding
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
