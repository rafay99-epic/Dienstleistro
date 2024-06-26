import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dienstleisto/frontend/screens/auth/login/login.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenSize = MediaQuery.of(context).size;

    // Calculate the scale factor
    final scaleFactor = screenSize.height / 896;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black87,
                    Colors.grey,
                    Colors.grey,
                    Colors.grey
                  ],
                  stops: [0.2, 0.5, 0.5, 1.0],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 175 * scaleFactor, // Scale the height
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Dienstleisto",
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.right,
                        fontFamily: "ABeeZee",
                      )),
                ),
                SizedBox(
                  height: 40 * scaleFactor, // Scale the height
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Enjoy your work \n",
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
                                text: "right now",
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
                SizedBox(height: 15 * scaleFactor), // Scale the height
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: MyText(
                      text:
                          "Achieve your dreams and career in the workplace you desire",
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100 * scaleFactor, // Scale the height
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 33, right: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '03',
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
                    currentValue: 80,
                    backgroundColor: Colors.grey.shade300,
                    progressColor: Theme.of(context).colorScheme.secondary,
                    maxValue: 100,
                    animatedDuration: const Duration(seconds: 2),
                    direction: Axis.horizontal,
                    size: 5,
                  ),
                ),
                SizedBox(
                  height: 170 * scaleFactor, // Scale the height
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 16.0,
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
                            child: const login(),
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Adjust as needed
                        ),
                      ),
                      child: MyText(
                        text: 'Get Started',
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 17,
                        textAlign: TextAlign.center,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
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
                            child: const login(),
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
      ),
    );
  }
}
