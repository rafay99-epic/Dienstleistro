// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String notificationTitle;
  final String jobTitle;
  final String message;
  final String time;

  const NotificationCard({
    Key? key,
    required this.notificationTitle,
    required this.jobTitle,
    required this.message,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText(
              text: notificationTitle,
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            MyText(
              text: jobTitle,
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            MyText(
              text: message,
              fontFamily: "ABeeZee",
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(time, style: const TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
