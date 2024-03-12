import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

// class CustomRadioButton extends StatelessWidget {
//   final String radioName;
//   final bool selectedValue;
//   final ValueChanged<bool> onChanged;

//   const CustomRadioButton({
//     Key? key,
//     required this.radioName,
//     required this.selectedValue,
//     required this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onChanged(!selectedValue);
//       },
//       child: Container(
//         width: 24,
//         height: 24,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: selectedValue ? Colors.green : Colors.transparent,
//           border: Border.all(
//             color: Colors.green,
//             width: 2,
//           ),
//         ),
//         child: selectedValue
//             ? const Icon(
//                 Icons.check,
//                 size: 16,
//                 color: Colors.white,
//               )
//             : null,
//       ),
//     );
//   }
// }

class CustomRadioButton extends StatelessWidget {
  final String radioName;
  final bool selectedValue;
  final ValueChanged<bool> onChanged;

  const CustomRadioButton({
    Key? key,
    required this.radioName,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!selectedValue);
      },
      child: Row(
        children: <Widget>[
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedValue ? Colors.green : Colors.transparent,
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 1,
              ),
            ),
            child: selectedValue
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          MyText(
            text: radioName,
            fontWeight: FontWeight.w400,
            fontFamily: "ABeeZee",
            fontStyle: FontStyle.italic,
            fontSize: 17,
            color: selectedValue
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
    );
  }
}
