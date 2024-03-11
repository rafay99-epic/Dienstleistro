import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class JobCardCategory extends StatelessWidget {
  final IconData icon;
  final String categoryTitle;
  final String jobOpening;
  final VoidCallback onTap;

  const JobCardCategory({
    super.key,
    required this.icon,
    required this.categoryTitle,
    required this.jobOpening,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Center(
              child: Icon(
                size: 30,
                icon,
                color: Colors.white,
              ),
            ),
          ),
          title: MyText(
            text: categoryTitle,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w400,
            fontFamily: "ABeeZee",
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
          subtitle: MyText(
            text: jobOpening,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w400,
            fontFamily: "ABeeZee",
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
