import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          return _buildRatingSection(index);
        }),
      ),
    );
  }

  Widget _buildRatingSection(int index) {
    bool isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.secondary
                : Colors.transparent,
            borderRadius: index == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )
                : index == 4
                    ? const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                    : BorderRadius.circular(0),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: isSelected
                  ? null
                  : Border(
                      right: BorderSide(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          width: 1.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: '${index + 1}',
                  color: isSelected
                      ? Theme.of(context).colorScheme.background
                      : Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.star,
                  color: isSelected
                      ? Theme.of(context).colorScheme.background
                      : Colors.amber,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
