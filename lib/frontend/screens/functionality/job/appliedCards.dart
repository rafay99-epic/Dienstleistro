// ignore_for_file: file_names

import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String logoPath;
  final String companyName;
  final String location;
  final String action;

  const JobCard({
    super.key,
    required this.logoPath,
    required this.companyName,
    required this.location,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 22.5,
          backgroundImage: AssetImage(logoPath),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText(
              text: companyName,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary,
            ),
            MyText(
              text: location,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: action == 'Interviewed'
                    ? Colors.purple
                    : action == 'Reviewed'
                        ? Colors.orange
                        : Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: MyText(
                text: action,
                color: Theme.of(context).colorScheme.background,
                fontSize: 13,
              ),
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 10),
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Option 1'),
                ),
              ],
              onSelected: (value) {
                // Handle your option selection here
              },
            ),
          ],
        ),
      ),
    );
  }
}
