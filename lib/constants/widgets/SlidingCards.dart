// import 'package:dienstleisto/frontend/widgets/textStyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class SlidingCards extends StatelessWidget {
//   final int itemCount;
//   final List<IconData> icons;
//   final List<String> categories;
//   final List<String> jobs;

//   const SlidingCards({
//     Key? key,
//     required this.itemCount,
//     required this.icons,
//     required this.categories,
//     required this.jobs,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       // width: 800,
//       child: PageView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: itemCount,
//         // controller: PageController(viewportFraction: 0.3),
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(
//               left: 4.0,
//               right: 4.0,
//             ),
//             child: Column(
//               children: [
//                 Card(
//                   color: Colors.blue,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Icon(
//                       icons[index],
//                       size: 80,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Align(
//                   child: MyText(
//                     text: categories[index],
//                     fontWeight: FontWeight.w400,
//                     fontFamily: "ABeeZee",
//                     fontStyle: FontStyle.italic,
//                     color: Theme.of(context).colorScheme.primary,
//                     fontSize: 13,
//                   ),
//                 ),
//                 Text(
//                   jobs[index],
//                   style: TextStyle(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                     fontFamily: "ABeeZee",
//                     fontStyle: FontStyle.italic,
//                     color: Theme.of(context).colorScheme.inversePrimary,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlidingCards extends StatelessWidget {
  final int itemCount;
  final List<IconData> icons;
  final List<String> categories;
  final List<String> jobs;

  const SlidingCards({
    Key? key,
    required this.itemCount,
    required this.icons,
    required this.categories,
    required this.jobs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.25),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
            ),
            child: Column(
              children: [
                Container(
                  width: 95,
                  height: 95,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      icons[index],
                      size: 50,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  child: MyText(
                    text: categories[index],
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 13,
                  ),
                ),
                Text(
                  jobs[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
