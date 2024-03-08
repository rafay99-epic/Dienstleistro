// ignore_for_file: use_build_context_synchronously

import 'package:dienstleisto/backend/auth/auth_service.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/login.dart';
import 'package:dienstleisto/frontend/screens/functionality/auth/signup.dart';
import 'package:dienstleisto/frontend/screens/functionality/services/servicesOffer/action.dart';
import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
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
          ],
        ),
      ),
    );
  }
}
