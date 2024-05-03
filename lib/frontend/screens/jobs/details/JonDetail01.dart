// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/jobs/details/customInform.dart';
import 'package:dienstleisto/frontend/screens/jobs/details/topInfor.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/cardSlider.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobDetail01 extends StatefulWidget {
  const JobDetail01({super.key});

  @override
  _JobDetail01State createState() => _JobDetail01State();
}

class _JobDetail01State extends State<JobDetail01> {
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
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: <Widget>[
              CustomInfoWidget(
                imagePath:
                    'https://plus.unsplash.com/premium_photo-1664870883044-0d82e3d63d99?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                jobTitle: 'Senior Software Engineer',
                studio: 'Studio',
                location: 'San Francisco, CA',
                rating: 4.9,
                ratingCount: 349,
                onShareTap: () {
                  // Handle your link share action here
                },
                onBookmarkTap: () {
                  // Handle your bookmark action here
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Job Overview",
                  fontFamily: "ABeeZee",
                  fontSize: 17,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                ),
              ),
              JobDescription(
                data: [
                  Pair(
                    InfoData(
                      icon: Icons.calendar_month_outlined,
                      title: 'Date Posted',
                      value: '2 hours ago',
                    ),
                    InfoData(
                      icon: Icons.timelapse_rounded,
                      title: 'Expiry Date',
                      value: '2 hours ago',
                    ),
                  ),
                  Pair(
                    InfoData(
                      icon: Icons.location_on,
                      title: 'Location',
                      value: 'Irvine, CA',
                    ),
                    InfoData(
                      icon: FontAwesomeIcons.briefcase,
                      title: 'Job Title',
                      value: 'Engineer',
                    ),
                  ),
                  Pair(
                    InfoData(
                      icon: FontAwesomeIcons.clockRotateLeft,
                      title: 'Hours',
                      value: '50h / week',
                    ),
                    InfoData(
                      icon: FontAwesomeIcons.trophy,
                      title: 'Experience',
                      value: '2+ years',
                    ),
                  ),
                  Pair(
                    InfoData(
                      icon: FontAwesomeIcons.handHoldingUsd,
                      title: 'Rate',
                      value: '\$500 / hour',
                    ),
                    InfoData(
                      icon: FontAwesomeIcons.moneyBill1,
                      title: 'Salary',
                      value: '2\$ - 7\$ ',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MyText(
                    text: "Applicant",
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: "ABeeZee",
                    fontStyle: FontStyle.italic,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: MyText(
                      text: "See all",
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              //Applicatinn Images
              const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1664870883044-0d82e3d63d99?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://plus.unsplash.com/premium_photo-1675034393381-7e246fc40755?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ),
              //Description Title:
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Description",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "About",
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text:
                      "We creates software that empowers everyone from small start-ups to large enterprises and helps teams everywhere change the world. Our products are revolutionizing the software industry and helping teams collaborate.",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Location",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text:
                      "43 Bourke Street, Newbridge NSW 837 Raffles Place, Boat Band M83",
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: "ABeeZee",
                  fontStyle: FontStyle.italic,
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 15),
              //mAPS

              const SizedBox(height: 15),
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      text: "Recent Posts",
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                      textAlign: TextAlign.left,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: MyText(
                        text: "See all",
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CardSlider(
                items: [
                  CardItem(
                    profileImage: "assets/images/image.jpg",
                    profileTitle: 'Reduso Company',
                    jobTitle: 'Electrical Engineeer',
                    location: '7363 California, USA',
                    payment: "9K/mo",
                    time: '1hour ago',
                    onBookmarkTap: () {
                      // Handle bookmark tap here
                    },
                  ),
                  CardItem(
                    profileImage: "assets/images/image.jpg",
                    profileTitle: 'Future Insight Technology',
                    jobTitle: 'Project Manager',
                    location: '7363 California, USA',
                    payment: "9K/mo",
                    time: '3hour ago',
                    onBookmarkTap: () {
                      // Handle bookmark tap here
                    },
                  ),

                  // Add more CardItem here if needed
                ],
                backgroundColor: Theme.of(context).colorScheme.background,
                showShadow: false,
                borderRadius: 10.0,
              ),
              const SizedBox(height: 25),

              CustomButton(
                onPressed: () async {},
                text: "Aplly Now",
                enableIcon: false,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                buttonTextColor: Theme.of(context).colorScheme.background,
                buttonTextSize: 17,
                buttonTextAlign: TextAlign.center,
                buttonTextFontFamily: 'ABeeZee',
                buttonTextfontStyle: FontStyle.italic,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
