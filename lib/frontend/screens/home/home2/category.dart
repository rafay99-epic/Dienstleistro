// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:dienstleisto/frontend/widgets/categoryCard.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 1,
                child: Text('Option 1'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Option 2'),
              ),
            ],
            onSelected: (value) {
              // Handle your option selection here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Categories",
                  fontSize: 34,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              JobCardCategory(
                icon: FontAwesomeIcons.computer,
                categoryTitle: 'Development',
                jobOpening: '273 open positions',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              JobCardCategory(
                icon: FontAwesomeIcons.paintBrush,
                categoryTitle: 'Design & Art',
                jobOpening: '96 open positions',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              JobCardCategory(
                icon: FontAwesomeIcons.briefcase,
                categoryTitle: 'Accounting',
                jobOpening: '192 open positions',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              JobCardCategory(
                icon: FontAwesomeIcons.briefcase,
                categoryTitle: 'Marketing',
                jobOpening: '348 open positions',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              JobCardCategory(
                icon: FontAwesomeIcons.servicestack,
                categoryTitle: 'Customer Service',
                jobOpening: '98 open positions',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
