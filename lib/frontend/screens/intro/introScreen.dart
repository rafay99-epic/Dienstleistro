// import 'package:dienstleisto/frontend/screens/intro/screen1.dart';
// import 'package:dienstleisto/frontend/screens/intro/screen2.dart';
// import 'package:dienstleisto/frontend/screens/intro/screen3.dart';
// import 'package:flutter/material.dart';

// class Intro extends StatefulWidget {
//   Intro({super.key});

//   @override
//   State<Intro> createState() => _IntroState();
// }

// class _IntroState extends State<Intro> {
//   //Controller
//   final PageController _pageController = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           PageView(
//             controller: _pageController,
//             children: const [
//               screen1(),
//               Screen2(),
//               Screen3(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:dienstleisto/frontend/screens/intro/screen1.dart';
import 'package:dienstleisto/frontend/screens/intro/screen2.dart';
import 'package:dienstleisto/frontend/screens/intro/screen3.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  //Controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
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
            PageView(
              controller: _pageController,
              children: const [
                screen1(),
                Screen2(),
                Screen3(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
