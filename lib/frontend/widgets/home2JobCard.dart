import 'package:flutter/material.dart';

class Home2JobCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String jobType;
  final double progress;
  final String imageUrl;

  const Home2JobCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.jobType,
    required this.progress,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 14),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        jobType,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        // Add this
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[200],
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
              radius: 30,
            ),
          ],
        ),
      ),
    );
  }
}
