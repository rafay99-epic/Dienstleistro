// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class OneCustomRadioButton extends StatefulWidget {
  const OneCustomRadioButton({super.key});

  @override
  _OneCustomRadioButtonState createState() => _OneCustomRadioButtonState();
}

class _OneCustomRadioButtonState extends State<OneCustomRadioButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isSelected ? Colors.green : Colors.transparent,
              border: Border.all(
                color: _isSelected ? Colors.green : Colors.grey,
                width: 2,
              ),
            ),
            child: _isSelected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  )
                : null,
          ),
          const SizedBox(width: 8),
          MyText(
            text: 'I am currently working here',
            fontSize: 15,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
