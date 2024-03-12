// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/functionality/job/apply/appliedCards.dart';
import 'package:dienstleisto/frontend/screens/functionality/job/apply/appliedjobdetail.dart';
import 'package:dienstleisto/frontend/screens/functionality/job/apply/savedCard.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Job extends StatefulWidget {
  const Job({super.key});

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              // Handle search icon tap
            },
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Jobs",
                  fontSize: 34,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              tabs: [
                Tab(
                  child: Text(
                    'Applied For',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Saved',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Column(
                        children: <Widget>[
                          // Your widgets for the 'Applied For' tab...
                          JobCard(
                            logoPath: "assets/images/image.jpg",
                            companyName: '3D Animator',
                            location: 'Best Studio ',
                            action: 'Interviewed',
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeftWithFade,
                                  child: const AppliedJobDetail(),
                                  duration: const Duration(milliseconds: 500),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 5),
                          JobCard(
                            logoPath: "assets/images/image.jpg",
                            companyName: 'Ux Designer',
                            location: 'Creative Studio',
                            action: 'Reviewed',
                            onTap: () {},
                          ),
                          const SizedBox(height: 5),
                          JobCard(
                            logoPath: "assets/images/image.jpg",
                            companyName: 'Product Designer',
                            location: 'Creative Studio',
                            action: 'Reviewed',
                            onTap: () {},
                          ),
                          const SizedBox(height: 5),
                          JobCard(
                            logoPath: "assets/images/image.jpg",
                            companyName: '3D Animator',
                            location: 'Limited Studio',
                            action: 'Pending',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          // Your widgets for the 'Saved' tab...
                          SavedJobCard(
                            jobTitle: 'Producr Designer ',
                            companyName: 'Limited Sounds',
                            jobType: 'Full Time',
                            payment: '\$1000',
                            profileImagePath: "assets/images/image.jpg",
                          ),
                          SizedBox(height: 5),
                          SavedJobCard(
                            jobTitle: '3D Animator',
                            companyName: 'Complex Studio',
                            jobType: 'Full Time',
                            payment: '\$1000',
                            profileImagePath: "assets/images/image.jpg",
                          ),
                          SizedBox(height: 5),
                          SavedJobCard(
                            jobTitle: 'Ux Designer',
                            companyName: 'Creative Studio',
                            jobType: 'Full Time',
                            payment: '\$1000',
                            profileImagePath: "assets/images/image.jpg",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
