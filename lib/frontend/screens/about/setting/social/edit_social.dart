import 'package:dienstleisto/backend/api/profile/api_update_profile.dart';
import 'package:dienstleisto/backend/provider/provider.dart';
import 'package:dienstleisto/constants/widgets/errorAndLoading/snakbar/snakbar.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/constants/widgets/textfeild2.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class updateSocailAccount extends StatelessWidget {
  updateSocailAccount({super.key});

  final TextEditingController facebookController = TextEditingController();
  final TextEditingController youtubeController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                text: "Update Social Account",
                fontSize: 25,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                fontFamily: "ABeeZee",
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                hintText: "Facebook",
                icon: Icons.facebook,
                controller: facebookController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Youtube",
                icon: FontAwesomeIcons.youtube,
                controller: youtubeController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Twitter",
                icon: FontAwesomeIcons.twitter,
                controller: twitterController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Instagram",
                icon: FontAwesomeIcons.instagram,
                controller: instagramController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Website",
                icon: Icons.web,
                controller: websiteController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                hintText: "Other",
                icon: Icons.add,
                controller: otherController,
              ),
              const SizedBox(
                height: 20,
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
                      onPressed: () => updateSocialMedia(context),
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
                        facebookController.clear();
                        youtubeController.clear();
                        twitterController.clear();
                        instagramController.clear();
                        websiteController.clear();
                        otherController.clear();
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

  Future<void> updateSocialMedia(BuildContext context) async {
    // Profile Update
    ProfileUpdate profileUpdate = ProfileUpdate();

    //Provider
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    //passing controller into the provider
    String facebook = facebookController.text;
    userProvider.setFacebook(facebook);
    String youtube = youtubeController.text;
    userProvider.setYoutube(youtube);
    String twitter = twitterController.text;
    userProvider.setTwitter(twitter);
    String instagram = instagramController.text;
    userProvider.setInstagram(instagram);
    String website = websiteController.text;
    userProvider.setWebsite(website);
    String other = otherController.text;
    userProvider.setOther(other);

    //Passign Provider Values in the Update Profile API
    bool success = await profileUpdate.updateProfile(
      name: userProvider.name,
      phoneNo: userProvider.phoneNo,
      gender: userProvider.usergender,
      language: userProvider.userlanguage,
      country: userProvider.userCountry,
      address: userProvider.userAddress,
      state: userProvider.userState,
      zipCode: userProvider.userZipcode,
      about: userProvider.aboutMe,
      facebook: facebookController.text,
      youtube: youtubeController.text,
      twitter: twitterController.text,
      instagram: instagramController.text,
      website: websiteController.text,
      other: otherController.text,
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
