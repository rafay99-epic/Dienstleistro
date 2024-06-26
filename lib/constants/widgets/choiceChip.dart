// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  final String label;

  const CustomChoiceChip({super.key, required this.label});

  @override
  _CustomChoiceChipState createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: MyText(
        text: widget.label,
        color: _isSelected
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.primary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      selected: _isSelected,
      onSelected: (bool selected) {
        setState(() {
          _isSelected = selected;
        });
      },
      selectedColor: Theme.of(context).colorScheme.secondary,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
