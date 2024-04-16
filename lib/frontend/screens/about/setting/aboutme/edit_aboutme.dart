// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class EditAboutMe extends StatefulWidget {
  const EditAboutMe({super.key});

  @override
  _EditAboutMeState createState() => _EditAboutMeState();
}

class _EditAboutMeState extends State<EditAboutMe> {
  final TextEditingController aboutMeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                MyText(
                  text: "Update About Me",
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  fontFamily: "ABeeZee",
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: aboutMeController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Edit About Me',
                    fillColor: Theme.of(context).colorScheme.background,
                    filled: true,
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: 'ABeeZee',
                      fontStyle: FontStyle.normal,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.background,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle button 1 click
                        },
                        child: MyText(
                          text: 'Update',
                          color: Theme.of(context).colorScheme.background,
                          fontFamily: 'ABeeZee',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.primary,
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Handle button 2 click
                        },
                        child: MyText(
                          text: 'Cancel',
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: 'ABeeZee',
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
