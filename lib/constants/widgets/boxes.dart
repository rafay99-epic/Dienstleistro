// import 'package:flutter/material.dart';

// class CustomInkWell extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final VoidCallback onTap;

//   const CustomInkWell({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.description,
//     required this.onTap,
//   }) : super(key: key);

// ignore_for_file: library_private_types_in_public_api

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(12.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.black, width: 2),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 icon,
//                 size: 50,
//               ),
//               const SizedBox(width: 30),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       description,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//version: 02
// import 'package:flutter/material.dart';

// class CustomInkWell extends StatefulWidget {
//   final String title;
//   final String description;
//   final IconData icon;

//   const CustomInkWell({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   _CustomInkWellState createState() => _CustomInkWellState();
// }

// class _CustomInkWellState extends State<CustomInkWell> {
//   bool _selected = false;

//   void _toggleSelected() {
//     setState(() {
//       _selected = !_selected;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: _toggleSelected,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(12.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.black, width: 2),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 widget.icon,
//                 color: Colors.grey,
//                 size: 50,
//               ),
//               const SizedBox(width: 30),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.title,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Icon(
//                           Icons.check_circle,
//                           color: _selected ? Colors.green : Colors.grey,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     Text(
//                       widget.description,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Version 03:
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

// class CustomInkWell extends StatefulWidget {
//   final String title;
//   final String description;
//   final IconData icon;

//   const CustomInkWell({
//     Key? key,
//     required this.title,
//     required this.description,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   _CustomInkWellState createState() => _CustomInkWellState();
// }

// class _CustomInkWellState extends State<CustomInkWell> {
//   bool _selected = false;

//   void _toggleSelected() {
//     setState(() {
//       _selected = !_selected;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: _toggleSelected,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(12.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(
//               color: _selected
//                   ? Theme.of(context).colorScheme.secondary
//                   : Colors.grey,
//               width: 2,
//             ),
//           ),
//           child: Row(
//             children: <Widget>[
//               Icon(
//                 widget.icon,
//                 color: _selected
//                     ? Theme.of(context).colorScheme.secondary
//                     : Colors.grey,
//                 size: 50,
//               ),
//               const SizedBox(width: 30),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           widget.title,
//                           style: const TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Icon(
//                           Icons.check_circle,
//                           color: _selected ? Colors.green : Colors.grey,
//                           size: 20,
//                         ),
//                       ],
//                     ),
//                     Text(
//                       widget.description,
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//version 04 Select one

class CustomInkWell extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const CustomInkWell({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: selected ? Colors.blue : Colors.grey, width: 2),
          ),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: selected ? Colors.blue : Colors.grey,
                size: 50,
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyText(
                          text: title,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 17,
                          fontFamily: "ABeeZee",
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: selected ? Colors.green : Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                    MyText(
                      text: description,
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 15,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
