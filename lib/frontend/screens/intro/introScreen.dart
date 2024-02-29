// import 'package:dienstleisto/frontend/screens/choose.dart';
// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';

// class IntroScreen extends StatelessWidget {
//   const IntroScreen({super.key});

//   List<PageViewModel> getPages() {
//     return [
//       PageViewModel(
//         title: "Screen 1",
//         bodyWidget: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.white, Colors.black],
//                 ),
//               ),
//             ),
//             const Center(
//               child: Text(
//                 "This is the first introduction screen.",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ),
//       PageViewModel(
//         title: "Screen 2",
//         body: "This is the second introduction screen.",
//         image: const Center(child: Icon(Icons.bubble_chart, size: 100.0)),
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IntroductionScreen(
//       pages: getPages(),
//       onDone: () {
//         // When done button is press
//         Navigator.of(context).push(
//           MaterialPageRoute(builder: (_) => const choosePage()),
//         );
//       },
//       onSkip: () {
//         // You can also override onSkip callback
//       },
//       showSkipButton: true,
//       skip: const Text("Skip"),
//       next: const Icon(Icons.arrow_forward),
//       done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
//     );
//   }
// }

import 'package:dienstleisto/frontend/screens/intro/screen1.dart';
import 'package:dienstleisto/frontend/screens/intro/screen2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  //Controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [
              screen1(),
              Screen2(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(controller: _pageController, count: 2),
            ),
          )
        ],
      ),
    );
  }
}
