// ignore_for_file: camel_case_types

import 'package:dienstleisto/frontend/screens/home.dart';
import 'package:dienstleisto/frontend/widgets/boxes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class choosePage extends StatefulWidget {
  const choosePage({super.key});

  @override
  State<choosePage> createState() => _choosePageState();
}

class _choosePageState extends State<choosePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Continue as ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "To continue to next page, Please select which one you are",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            CustomInkWell(
              icon: Icons.person,
              title: "Job Seeker",
              description: "Find your dream job and build your dream",
              onTap: () {
                // Handle tap
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: const Home(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomInkWell(
              icon: Icons.person,
              title: "Company",
              description: "Recruit the best talent and build your",
              onTap: () {
                // Handle tap
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.rightToLeftWithFade,
                    child: const Home(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
