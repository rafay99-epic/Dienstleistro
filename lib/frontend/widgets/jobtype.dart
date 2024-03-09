import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CustomRadioList extends StatefulWidget {
  final List<String> options;

  CustomRadioList({required this.options});

  @override
  _CustomRadioListState createState() => _CustomRadioListState();
}

class _CustomRadioListState extends State<CustomRadioList> {
  int? _selectedRadio;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.options.length,
        (index) {
          return ListTile(
            title: MyText(
              text: widget.options[index],
              color: Theme.of(context).colorScheme.primary,
              fontSize: 17,
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
            ),
            trailing: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              child: _selectedRadio == index
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : Icon(Icons.circle,
                      color: Theme.of(context).colorScheme.background),
            ),
            onTap: () {
              setState(() {
                _selectedRadio = index;
              });
            },
          );
        },
      ),
    );
  }
}
