import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final Color hintColor;
  final EdgeInsets padding;
  final TextEditingController controller;
  final bool enableOnlyNumbers;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.fillColor = Colors.grey,
    this.hintColor = Colors.white,
    this.padding = const EdgeInsets.only(left: 0.0, right: 0.0),
    this.enableOnlyNumbers = false,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        keyboardType: enableOnlyNumbers ? TextInputType.number : null,
        obscureText: obscureText,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
