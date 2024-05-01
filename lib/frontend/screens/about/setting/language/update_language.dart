// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/backend/api/profile/api_update_education.dart';
import 'package:dienstleisto/backend/class/language_class.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateLanguagesScreen extends StatefulWidget {
  const UpdateLanguagesScreen({super.key});

  @override
  _UpdateLanguagesScreenState createState() => _UpdateLanguagesScreenState();
}

class _UpdateLanguagesScreenState extends State<UpdateLanguagesScreen> {
  final UpdateLanguageAPI updateLanguageAPI = UpdateLanguageAPI();
  late List<UserLanguage> updatedLanguages = [];
  final UserProvider provider = UserProvider();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<TextEditingController> nameControllers = userProvider.languages
        .map((language) => TextEditingController(text: language.name))
        .toList();

    List<TextEditingController> percentageControllers = userProvider.languages
        .map((language) =>
            TextEditingController(text: language.percentage.toString()))
        .toList();
    //updating the Language
    void updateLanguage(BuildContext context) async {
      for (var i = 0; i < userProvider.languages.length; i++) {
        var language = userProvider.languages[i];
        language.name = nameControllers[i].text;
        language.percentage = int.parse(percentageControllers[i].text);

        bool success = await updateLanguageAPI.updateLanguage(language);
        if (!success) {
          print('Failed to update language: ${language.name}');
        } else {
          updatedLanguages.add(language);
        }
      }
      userProvider.setLanguages(updatedLanguages);
    }

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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              MyText(
                text: "Update Languages",
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                fontFamily: "ABeeZee",
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: userProvider.languages.asMap().entries.map((entry) {
                  int index = entry.key;
                  return Card(
                    child: ListTile(
                      title: TextField(
                        controller: nameControllers[index],
                        decoration: InputDecoration(
                          hintText: 'Language Name',
                          fillColor: Theme.of(context).colorScheme.background,
                          filled: true,
                          prefixIcon: Icon(Icons.language,
                              color: Theme.of(context).colorScheme.primary),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary,
                                width: 1.0),
                          ),
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          const SizedBox(height: 5),
                          TextField(
                            controller: percentageControllers[index],
                            decoration: InputDecoration(
                              hintText: 'Percentage',
                              fillColor:
                                  Theme.of(context).colorScheme.background,
                              filled: true,
                              prefixIcon: Icon(Icons.percent,
                                  color: Theme.of(context).colorScheme.primary),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    width: 1.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 25),
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
                      onPressed: () => updateLanguage(context),
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
                        foregroundColor: Theme.of(context).colorScheme.primary,
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
                        Navigator.pop(context);
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
      ),
    );
  }

  // void updateLanguage(BuildContext context) async {
  //   //   final userProvider = Provider.of<UserProvider>(context, listen: false);

  //   //   for (var language in userProvider.languages) {
  //   //     language.name = nameController.text;
  //   //     language.percentage = percentageController.text;

  //   //     bool success = await updateLanguageAPI.updateLanguage(language);
  //   //     if (!success) {
  //   //       print('Failed to update language: ${language.name}');
  //   //     }
  //   //   }
  // }
}
