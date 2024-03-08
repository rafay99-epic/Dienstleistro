import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color fillColor;
  final Color hintColor;
  final EdgeInsets padding;
  final TextEditingController controller;
  final bool enableOnlyNumbers;
  final bool obscureText;
  final bool enableDropdown;
  final List<String> dropdownOptions;
  final bool enableDate;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.fillColor = Colors.grey,
    this.hintColor = Colors.white,
    this.padding = const EdgeInsets.only(left: 0.0, right: 0.0),
    this.enableOnlyNumbers = false,
    this.obscureText = false,
    this.enableDropdown = false,
    this.dropdownOptions = const [],
    this.enableDate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy'); // Initialize DateFormat here

    return Padding(
      padding: padding,
      child: enableDropdown
          ? DropdownButtonFormField<String>(
              items: dropdownOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                controller.text = newValue ?? '';
              },
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
            )
          : enableDate
              ? TextFormField(
                  controller: controller,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      controller.text = dateFormat.format(date);
                    }
                  },
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
                    suffixIcon: Icon(
                      Icons.calendar_today_rounded,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ), //
                  ),
                )
              : TextField(
                  controller: controller,
                  keyboardType: enableOnlyNumbers ? TextInputType.number : null,
                  obscureText: obscureText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
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
