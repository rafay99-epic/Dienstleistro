// import 'package:dienstleisto/frontend/widgets/textStyle.dart';
// import 'package:flutter/material.dart';

// class CustomButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Color? backgroundColor;
//   final double borderRadius;
//   final IconData? icon;
//   final String text;
//   final EdgeInsets padding;
//   final bool enableIcon;

//   const CustomButton({
//     Key? key,
//     required this.onPressed,
//     this.icon,
//     required this.text,
//     required this.enableIcon,
//     this.backgroundColor,
//     this.borderRadius = 10.0,
//     this.padding = const EdgeInsets.only(left: 0.0, right: 0.0),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding,
//       child: SizedBox(
//         width: double.infinity,
//         height: 50,
//         child: ElevatedButton(
//           onPressed: onPressed,
//           style: ElevatedButton.styleFrom(
//             backgroundColor: backgroundColor ?? Colors.amber,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (enableIcon) ...[
//                 Icon(icon, color: Colors.white),
//                 const SizedBox(width: 10),
//               ],
//               MyText(
//                 text: text,
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final IconData? icon;
  final String text;
  final EdgeInsets padding;
  final bool enableIcon;
  final Color buttonTextColor;
  final double buttonTextSize;
  final TextAlign buttonTextAlign;
  final String buttonTextFontFamily;
  final FontStyle buttonTextfontStyle;
  final Color iconColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.icon,
    required this.text,
    required this.enableIcon,
    this.iconColor = Colors.white, // default color is white

    this.backgroundColor,
    this.borderRadius = 10.0,
    this.padding = const EdgeInsets.only(left: 0.0, right: 0.0),
    required this.buttonTextColor,
    required this.buttonTextSize,
    required this.buttonTextAlign,
    required this.buttonTextFontFamily,
    required this.buttonTextfontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (enableIcon) ...[
                Icon(icon, color: iconColor),
                const SizedBox(width: 10),
              ],
              MyText(
                text: text,
                color: buttonTextColor,
                fontSize: buttonTextSize,
                fontWeight: FontWeight.normal,
                textAlign: buttonTextAlign,
                fontFamily: buttonTextFontFamily,
                fontStyle: buttonTextfontStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
