import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class SavedJobCard extends StatelessWidget {
  final String jobTitle;
  final String companyName;
  final String jobType;
  final String payment;
  final String profileImagePath;

  const SavedJobCard({
    super.key,
    required this.jobTitle,
    required this.companyName,
    required this.jobType,
    required this.payment,
    required this.profileImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage(profileImagePath),
        ),
        title: MyText(
          text: jobTitle,
          fontWeight: FontWeight.w400,
          fontFamily: "ABeeZee",
          fontStyle: FontStyle.italic,
          fontSize: 15,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyText(
              text: jobTitle,
              fontWeight: FontWeight.w400,
              fontFamily: "ABeeZee",
              fontSize: 13,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            Row(
              children: <Widget>[
                MyText(
                  text: jobType,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(
                    width:
                        8.0), // Add some space between the jobType and payment
                MyText(
                  text: '\$$payment per month',
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.primary,
                ), // Add dollar sign and 'per month'
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.bookmark_border,
            color: Colors.red,
          ),
          onPressed: () {
            // Handle save icon tap
          },
        ),
      ),
    );
  }
}
