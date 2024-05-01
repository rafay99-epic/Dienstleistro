// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:dienstleisto/backend/api/profile/api_update_profile.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/errorAndLoading/snakbar/snakbar.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditAboutMe extends StatefulWidget {
  const EditAboutMe({super.key});

  @override
  _EditAboutMeState createState() => _EditAboutMeState();
}

class _EditAboutMeState extends State<EditAboutMe> {
  final TextEditingController aboutMeController = TextEditingController();
  late UserProvider provider = UserProvider();

  @override
  void initState() {
    super.initState();
    provider = Provider.of<UserProvider>(context, listen: false);
    aboutMeController.text = provider.aboutMe;
  }

  @override
  void dispose() {
    aboutMeController.dispose();
    super.dispose();
  }

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
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
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
                          updateAboutme(context);
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
                          aboutMeController.clear();
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
        ));
  }

  Future<void> updateAboutme(BuildContext context) async {
    // Profile Update
    ProfileUpdate profileUpdate = ProfileUpdate();

    //Provider
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    // Setting About me
    String aboutMe = aboutMeController.text;
    //Set value in the Provider
    userProvider.setAboutMe(aboutMe);

    //Passign Provider Values in the Update Profile API
    bool success = await profileUpdate.updateProfile(
      name: userProvider.name,
      phoneNo: userProvider.phoneNo,
      gender: userProvider.usergender,
      language: userProvider.userlanguage,
      country: userProvider.userCountry,
      address: userProvider.address,
      state: userProvider.state,
      zipCode: userProvider.userZipcode,
      about: userProvider.aboutMe,
      facebook: userProvider.facebook,
      youtube: userProvider.youtube,
      twitter: userProvider.twitter,
      instagram: userProvider.instagram,
      website: userProvider.website,
      other: userProvider.other,
      profession: userProvider.proffesion,
    );

    if (success) {
      showSnackBar(context, 'Abdout Me  Successfully');
      Navigator.pop(context);
    } else {
      showSnackBar(context, 'Failed to Update About Me');
    }
  }
}
