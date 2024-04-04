// import 'dart:math';

// import 'package:flutter/material.dart';

// // class IntroStepper extends StatefulWidget {
// //   @override
// //   _IntroStepperState createState() => _IntroStepperState();
// // }

// class IntroStepper extends StatefulWidget {
//   @override
//   _IntroStepperState createState() => _IntroStepperState();
// }

// class _IntroStepperState extends State<IntroStepper> {
//   double _progress = 0;
//   Color _progressColor = Colors.blue;

//   void updateProgress(int value) {
//     setState(() {
//       _progress = value / 3;
//       _progressColor = _progress == 1 ? Colors.green : Colors.blue;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return SizedBox(
//           height: constraints.maxWidth,
//           width: 5,
//           child: Transform.rotate(
//             angle: -pi / 2,
//             child: LinearProgressIndicator(
//               value: _progress,
//               color: _progressColor,
//               backgroundColor: Colors.grey[200],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// // class _IntroStepperState extends State<IntroStepper> {
// //   int _currentStep = 0;

// ignore_for_file: no_logic_in_create_state, prefer_final_fields

// //   @override
// //   Widget build(BuildContext context) {
// //     return Stepper(
// //       currentStep: _currentStep,
// //       onStepTapped: (step) => setState(() => _currentStep = step),
// //       steps: [
// //         Step(
// //           title: Text("Intro Page ${_currentStep + 1}"),
// //           content: Text("Content for Intro Page ${_currentStep + 1}"),
// //           isActive: _currentStep == 0,
// //         ),
// //         Step(
// //           title: Text("Intro Page ${_currentStep + 2}"),
// //           content: Text("Content for Intro Page ${_currentStep + 2}"),
// //           isActive: _currentStep == 1,
// //         ),
// //         Step(
// //           title: Text("Intro Page ${_currentStep + 3}"),
// //           content: Text("Content for Intro Page ${_currentStep + 3}"),
// //           isActive: _currentStep == 2,
// //         ),
// //       ],
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class IntroStepper extends StatefulWidget {
  final int value;

  const IntroStepper({super.key, required this.value});

  @override
  // ignore: library_private_types_in_public_api
  _IntroStepperState createState() => _IntroStepperState(value);
}

class _IntroStepperState extends State<IntroStepper> {
  double _progress = 0;
  Color _progressColor = const Color.fromRGBO(25, 103, 210, 1);
  final int _value;

  _IntroStepperState(this._value);

  @override
  void initState() {
    super.initState();
    updateProgress(_value);
  }

  void updateProgress(int value) {
    setState(() {
      switch (value) {
        case 1:
          _progress = 0.2;
          break;
        case 2:
          _progress = 0.5;
          break;
        case 3:
          _progress = 1.0;
          break;
        default:
          _progress = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: constraints.maxWidth,
          width: 30, // Reduce this to make the progress bar thinner
          child: Transform.rotate(
            angle: -pi / 2,
            child: LinearProgressIndicator(
              value: _progress,
              color: _progressColor,
              backgroundColor: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
