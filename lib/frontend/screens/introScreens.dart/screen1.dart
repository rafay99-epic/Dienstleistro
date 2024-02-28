import 'package:dienstleisto/frontend/screens/home.dart';
import 'package:dienstleisto/frontend/screens/introScreens.dart/screen2.dart';
import 'package:flutter/material.dart';

class screen1 extends StatelessWidget {
  const screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.black],
              ),
            ),
          ),
          const Center(
            child: Text(
              "This is the first introduction screen.",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to the next screen when the skip button is pressed
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    ),
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
