// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'package:dienstleisto/constants/widgets/social.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:dienstleisto/frontend/screens/about/setting/aboutme/edit_aboutme.dart';
import 'package:dienstleisto/frontend/screens/about/setting/contactMe/edit_contactme.dart';
import 'package:dienstleisto/frontend/screens/about/setting/social/edit_social.dart';

class AboutMeTemplate extends StatefulWidget {
  final String name;
  final String jobTitle;
  final String profileImageUrl;
  final String aboutMeText;
  final String mobilePhone;
  final String emailAddress;

  final String address;
  final String facebookLink;
  final String twitterLink;
  final String instagramLink;
  final String websiteLink;
  final String otherLink;
  final String youtubeLink;
  const AboutMeTemplate({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.profileImageUrl,
    required this.aboutMeText,
    required this.mobilePhone,
    required this.emailAddress,
    required this.address,
    required this.facebookLink,
    required this.twitterLink,
    required this.instagramLink,
    required this.websiteLink,
    required this.otherLink,
    required this.youtubeLink,
  }) : super(key: key);

  @override
  _AboutMeTemplateState createState() => _AboutMeTemplateState();
}

class _AboutMeTemplateState extends State<AboutMeTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 43,
                    backgroundImage: NetworkImage(widget.profileImageUrl),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MyText(
                        text: widget.name,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.primary,
                        fontStyle: FontStyle.italic,
                      ),
                      MyText(
                        text: widget.jobTitle,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontStyle: FontStyle.italic,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              //about me heading and clip edit button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'About me',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const EditAboutMe(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0), // Add some padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            20.0), // Make the border rounded
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the text and icon
                        children: <Widget>[
                          const Icon(Icons.edit),
                          const SizedBox(width: 4.0),
                          MyText(
                            text: 'Edit',
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              //about me Text and clip edit button
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: widget.aboutMeText,
                  fontSize: 15,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //containcts heading with edit clip button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'Contacts ',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const UpdateContactInformation(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0), // Add some padding
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            20.0), // Make the border rounded
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Center the text and icon
                        children: <Widget>[
                          const Icon(Icons.edit),
                          const SizedBox(width: 4.0),
                          MyText(
                            text: 'Edit',
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // three contacts

              // 1. Phone  Number
              // 2. Email
              // 3. Address
              Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: MyText(
                      text: 'Mobile Phone',
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    subtitle: MyText(
                      text: widget.mobilePhone,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ), // Replace with your mobile phone number
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: MyText(
                      text: 'Email Address',
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    subtitle: MyText(
                      text: widget.emailAddress,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ), // Replace with your email address
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    title: MyText(
                      text: 'Address',
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    subtitle: MyText(
                      text: widget.address,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              // Skill heading and edit clip button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'Socials',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const updateSocailAccount(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.edit),
                          const SizedBox(width: 4.0),
                          MyText(
                            text: 'Edit',
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // List of skills
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SocialMediaButton(
                    icon: FontAwesomeIcons.facebook,
                    url: widget.facebookLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.youtube,
                    url: widget.youtubeLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.twitter,
                    url: widget.twitterLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.instagram,
                    url: widget.instagramLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.globe,
                    url: widget.websiteLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  SocialMediaButton(
                    icon: FontAwesomeIcons.plus,
                    url: widget.otherLink,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'My Education',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.edit),
                        const SizedBox(width: 4.0),
                        MyText(
                          text: 'Edit',
                          fontFamily: "ABeeZee",
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //education information
              // title
              //university name
              // starting year
              // ending year
              // description or summary
              Card(
                color: Theme.of(context).colorScheme.background,
                child: ListTile(
                  leading: Icon(
                    Icons.school,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: MyText(
                    text: 'BSc. Computer Science',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  subtitle: MyText(
                    text: 'This is the education of ${widget.name}',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // My Resume heading and edit clip button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: 'My Resume',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(Icons.edit),
                        const SizedBox(width: 4.0),
                        MyText(
                          text: 'Edit',
                          fontFamily: "ABeeZee",
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Rusume Button.
              Card(
                color: Theme.of(context).colorScheme.background,
                child: ListTile(
                  leading: Icon(
                    Icons.description,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  title: MyText(
                    text: '${widget.name}\'s Resume',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  subtitle: MyText(
                    text: 'This is the resume of ${widget.name}',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
