// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';

// Version 03:
class Timeline extends StatefulWidget {
  int currentStep;

  Timeline({
    Key? key,
    required this.currentStep,
  }) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(double.infinity, 70.0),
            painter: LinePainter(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.currentStep = index;
                  });
                },
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.currentStep >= index
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.background,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 1.0,
                    ),
                  ),
                  child: Center(
                    child: index == 4
                        ? Icon(
                            Icons.flag,
                            color: widget.currentStep >= index
                                ? Theme.of(context).colorScheme.background
                                : Theme.of(context).colorScheme.secondary,
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: widget.currentStep >= index
                                  ? Theme.of(context).colorScheme.background
                                  : Theme.of(context).colorScheme.secondary,
                              fontSize: 20.0,
                            ),
                          ),
                  ),
                ),
              );
            }),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: List.generate(
          //     5,
          //     (index) {
          //       return GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             widget.currentStep = index;
          //           });
          //         },
          //         child: Container(
          //           width: 35.0,
          //           height: 35.0,
          //           margin: const EdgeInsets.all(10.0),
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: widget.currentStep >= index
          //                 ? Theme.of(context).colorScheme.secondary
          //                 : Theme.of(context).colorScheme.background,
          //             border: Border.all(
          //               color: Theme.of(context).colorScheme.secondary,
          //               width: 1.0,
          //             ),
          //           ),
          //           child: Center(
          //             child: Text(
          //               '${index + 1}',
          //               style: TextStyle(
          //                 color: widget.currentStep >= index
          //                     ? Theme.of(context).colorScheme.background
          //                     : Theme.of(context).colorScheme.secondary,
          //                 fontSize: 20.0,
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: List.generate(5, (index) {
          //     return GestureDetector(
          //       onTap: () {
          //         setState(() {
          //           widget.currentStep = index;
          //         });
          //       },
          //       child: Container(
          //         width: 35.0,
          //         height: 35.0,
          //         margin: const EdgeInsets.all(10.0),
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: widget.currentStep == index
          //               ? Theme.of(context).colorScheme.secondary
          //               : Theme.of(context).colorScheme.background,
          //           border: Border.all(
          //             color: Theme.of(context).colorScheme.secondary,
          //             width: 1.0,
          //           ),
          //         ),
          //         child: Center(
          //           child: Text(
          //             '${index + 1}',
          //             style: TextStyle(
          //               color: widget.currentStep == index
          //                   ? Theme.of(context).colorScheme.background
          //                   : Theme.of(context).colorScheme.secondary,
          //               fontSize: 20.0,
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(25, 103, 210, 1)
      ..strokeWidth = 2.0;

    const circleRadius = 30.0;
    final circleSpacing = (size.width - circleRadius * 5) / 6;

    for (var i = 0; i < 4; i++) {
      final startX =
          circleSpacing + circleRadius / 2 + i * (circleRadius + circleSpacing);
      final endX = startX + circleRadius + circleSpacing;
      final y = size.height / 2.7;

      canvas.drawLine(Offset(startX, y), Offset(endX, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
