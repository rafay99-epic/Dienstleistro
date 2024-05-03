// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final Color fillColor;
  final Color hintColor;
  final EdgeInsets padding;
  final TextEditingController controller;
  final bool enableOnlyNumbers;
  bool obscureText;
  final bool enableDropdown;
  final List<String> dropdownOptions;
  final bool enableDate;
  final int? maxLines;
  final bool showPassword;

  CustomTextField({
    Key? key,
    required this.hintText,
    this.fillColor = Colors.grey,
    this.hintColor = Colors.white,
    this.padding = const EdgeInsets.only(left: 0.0, right: 0.0),
    required this.controller,
    this.enableOnlyNumbers = false,
    this.obscureText = false,
    this.enableDropdown = false,
    this.dropdownOptions = const [],
    this.enableDate = false,
    this.maxLines = 1,
    this.showPassword = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');

    return Padding(
      padding: widget.padding,
      child: widget.enableDropdown
          ? DropdownButtonFormField<String>(
              items: widget.dropdownOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                widget.controller.text = newValue ?? '';
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: widget.fillColor,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.hintColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            )
          : widget.enableDate
              ? TextFormField(
                  controller: widget.controller,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      widget.controller.text = dateFormat.format(date);
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.fillColor,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: widget.hintColor,
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
                  controller: widget.controller,
                  maxLines: widget.maxLines,
                  keyboardType:
                      widget.enableOnlyNumbers ? TextInputType.number : null,
                  obscureText: widget.obscureText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: widget.fillColor,
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: widget.hintColor,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: widget.showPassword
                        ? IconButton(
                            // Check the value of showPassword here
                            icon: Icon(
                              widget.obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: widget.obscureText
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                widget.obscureText = !widget.obscureText;
                              });
                            },
                          )
                        : null,
                  ),
                ),
    );

    // TextField(
    //     controller: widget.controller,
    //     maxLines: widget.maxLines,
    //     keyboardType:
    //         widget.enableOnlyNumbers ? TextInputType.number : null,
    //     obscureText: widget.obscureText,
    //     style: TextStyle(
    //       color: Theme.of(context).colorScheme.primary,
    //     ),
    //     decoration: InputDecoration(
    //       filled: true,
    //       fillColor: widget.fillColor,
    //       hintText: widget.hintText,
    //       hintStyle: TextStyle(
    //         color: widget.hintColor,
    //       ),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(10),
    //         borderSide: BorderSide.none,
    //       ),
    //     ),
    //   ),
  }
}
