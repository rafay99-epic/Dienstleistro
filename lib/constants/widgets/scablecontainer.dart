// // ignore_for_file: library_private_types_in_public_api

// import 'package:dienstleisto/frontend/widgets/textStyle.dart';
// import 'package:flutter/material.dart';

// class SelectableContainer extends StatefulWidget {
//   final List<String> options;

//   const SelectableContainer({Key? key, required this.options})
//       : super(key: key);

//   @override
//   _SelectableContainerState createState() => _SelectableContainerState();
// }

// class _SelectableContainerState extends State<SelectableContainer> {
//   int _selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> children = <Widget>[];
//     widget.options.asMap().forEach((index, title) {
//       children.add(_buildContainer(index, title));
//       if (index != widget.options.length - 1) {
//         children.add(const SizedBox(width: 10)); // Add space
//       }
//     });
//     return Row(children: children);
//   }

//   Widget _buildContainer(int index, String title) {
//     bool isSelected = _selectedIndex == index;
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         child: Container(
//           height: 50,
//           alignment: Alignment.center,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.background,
//             border: Border.all(
//                 color: isSelected
//                     ? Theme.of(context).colorScheme.secondary
//                     : Theme.of(context).colorScheme.inversePrimary),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: MyText(
//             text: title,
//             color: isSelected
//                 ? Theme.of(context).colorScheme.secondary
//                 : Theme.of(context).colorScheme.primary,
//             fontFamily: "ABeeZee",
//             fontWeight: FontWeight.w400,
//             fontSize: 15,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatefulWidget {
  final List<String> options;

  const SelectableContainer({Key? key, required this.options})
      : super(key: key);

  @override
  _SelectableContainerState createState() => _SelectableContainerState();
}

class _SelectableContainerState extends State<SelectableContainer> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 6),
      children: List.generate(widget.options.length, (index) {
        return _buildContainer(index, widget.options[index]);
      }),
    );
  }

  Widget _buildContainer(int index, String title) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: MyText(
            text: title,
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.inversePrimary,
            fontFamily: "ABeeZee",
            fontWeight: FontWeight.w400,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

// class SelectableContainer extends StatefulWidget {
//   final List<String> options;

//   const SelectableContainer({Key? key, required this.options})
//       : super(key: key);

//   @override
//   _SelectableContainerState createState() => _SelectableContainerState();
// }

// class _SelectableContainerState extends State<SelectableContainer> {
//   int _selectedIndex = -1;

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> children = <Widget>[];
//     widget.options.asMap().forEach((index, title) {
//       children.add(_buildContainer(index, title));
//       children.add(const SizedBox(width: 10)); // Add space
//     });
//     return Wrap(children: children);
//   }

//   Widget _buildContainer(int index, String title) {
//     bool isSelected = _selectedIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         width:
//             MediaQuery.of(context).size.width / 2 - 15, // Adjust the width here
//         height: 50,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.background,
//           border: Border.all(
//               color: isSelected
//                   ? Theme.of(context).colorScheme.secondary
//                   : Theme.of(context).colorScheme.inversePrimary),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: MyText(
//           text: title,
//           color: isSelected
//               ? Theme.of(context).colorScheme.secondary
//               : Theme.of(context).colorScheme.primary,
//           fontFamily: "ABeeZee",
//           fontWeight: FontWeight.w400,
//           fontSize: 15,
//           fontStyle: FontStyle.italic,
//         ),
//       ),
//     );
//   }
// }
