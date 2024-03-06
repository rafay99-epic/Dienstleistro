import 'package:dienstleisto/frontend/screens/intro/choose.dart';
import 'package:dienstleisto/frontend/screens/intro/screen3.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

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
                colors: [Colors.black87, Colors.grey, Colors.grey, Colors.grey],
                stops: [0.2, 0.5, 0.5, 1.0],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const SizedBox(
                height: 175,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: MyText(
                      text: "Werktion",
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.right,
                      fontFamily: "ABeeZee",
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hired in a \n",
                          style: GoogleFonts.getFont(
                            "ABeeZee",
                            color: Theme.of(context).colorScheme.background,
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        WidgetSpan(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text: "dream company",
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 40,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.right,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text:
                        "Get a job at your dream company very easily without confusing",
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 30.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '02',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                        const TextSpan(
                          text: '/03',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30,
                  top: 10,
                ),
                child: FAProgressBar(
                  currentValue: 50,
                  backgroundColor: Colors.grey.shade300,
                  progressColor: Theme.of(context).colorScheme.secondary,
                  maxValue: 100,
                  animatedDuration: const Duration(seconds: 2),
                  direction: Axis.horizontal,
                  size: 5,
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: 16.0,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const Screen3(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Adjust as needed
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: TextButton(
                    onPressed: () {
                      // Navigate to the next screen when the skip button is pressed
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const choosePage(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: const MyText(
                      text: "Skip",
                      fontFamily: "ABeeZee",
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
