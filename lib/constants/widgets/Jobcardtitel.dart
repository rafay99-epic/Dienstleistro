// ignore_for_file: file_names

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class JobCardList extends StatelessWidget {
  final List<Map<String, String>> jobs;

  const JobCardList({Key? key, required this.jobs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Clicked on ${jobs[index]['title']}');
            },
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      Image.network(jobs[index]['profileImage']!).image,
                ),
                title: MyText(
                  text: jobs[index]['title']!,
                  fontFamily: "ABeeZee",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.primary,
                ),
                subtitle: MyText(
                  text: jobs[index]['jobNumber']!,
                  fontFamily: "ABeeZee",
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
