import 'package:flutter/material.dart';

class TagRow extends StatelessWidget {
  final List<String> tags;

  TagRow({required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0, // Adjust as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length + 1, // Add one for the "Filter" tag
        itemBuilder: (context, index) {
          if (index == 0) {
            // The first item is the "Filter" tag
            return GestureDetector(
              onTap: () {
                print('Clicked on Filter');
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Row(
                  children: [
                    Icon(Icons.filter_list,
                        color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 5.0),
                    Text(
                      'Filter',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            );
          } else {
            // The rest of the items are the tags
            return GestureDetector(
              onTap: () {
                print('Clicked on ${tags[index - 1]}');
              },
              child: Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                ),
                child: Center(
                  child: Text(
                    tags[index - 1],
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
