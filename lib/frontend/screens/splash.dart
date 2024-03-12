// ignore_for_file: camel_case_types

import 'package:dienstleisto/frontend/screens/intro/introScreen.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: Intro(),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyText(
            text: "Dienstleisto",
            color: Colors.white,
            fontSize: 60,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            fontFamily: "ABeeZee",
          ),
        ],
      )),
    );
  }
}
