// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/notification/notificationCard.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class NotificationShow extends StatefulWidget {
  const NotificationShow({super.key});

  @override
  _NotificationShowState createState() => _NotificationShowState();
}

class _NotificationShowState extends State<NotificationShow> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> notifications = [
      {
        'notificationTitle': 'Interview Reminder',
        'jobTitle': 'UX Designer',
        'message': 'Creatio Studio in Los Angeles, CA',
        'time': '2d',
      },
      {
        'notificationTitle': 'Application Viewed',
        'jobTitle': 'Product Designer',
        'message': 'Vacant Land in Irvine, CA',
        'time': '3h',
      },
      {
        'notificationTitle': 'Job Alert',
        'jobTitle': '3D Animator',
        'message': 'Complex Studio in San Diego, CA',
        'time': '1d',
      },
      {
        'notificationTitle': 'Interview Reminder',
        'jobTitle': 'UX Designer',
        'message': 'Creatio Studio in Los Angeles, CA',
        'time': '2d ',
      },
      {
        'notificationTitle': 'Application Viewed',
        'jobTitle': 'Product Designer',
        'message': 'Private Studio in Irvine, CA',
        'time': '4d ',
      },
      // Add more notifications as needed
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {
            // Handle filter icon tap
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle more icon tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: MyText(
                text: "Notifications",
                fontSize: 34,
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.left,
                color: Theme.of(context).colorScheme.primary,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            ...notifications.map((notification) {
              return NotificationCard(
                notificationTitle: notification['notificationTitle']!,
                jobTitle: notification['jobTitle']!,
                message: notification['message']!,
                time: notification['time']!,
              );
            }).toList(),
          ],
        ),
      )),
    );
  }
}
