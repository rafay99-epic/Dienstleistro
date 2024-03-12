// ignore_for_file: avoid_unnecessary_containers

import 'package:dienstleisto/frontend/screens/functionality/job/apply/savedCard.dart';
import 'package:dienstleisto/frontend/widgets/choiceChip.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class Job2Detail extends StatelessWidget {
  const Job2Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://plus.unsplash.com/premium_photo-1669882305273-674eff6567af?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Senior Experience Design Manager',
                        fontSize: 34.0,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        MyText(
                          text: 'Complex Studio',
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "ABeeZee",
                          fontStyle: FontStyle.italic,
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 10),
                        MyText(
                          text: 'San Francisco, CA',
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontFamily: "ABeeZee",
                          fontStyle: FontStyle.italic,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    IconTheme(
                      data: const IconThemeData(
                        color: Colors.amber,
                        // size: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            List.generate(5, (index) => const Icon(Icons.star)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Fun Fact",
                        fontFamily: "ABeeZee",
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: _buildCircularProgressBar(
                              0.3, "Would recommend", context),
                        ),
                        Expanded(
                          child: _buildCircularProgressBar(
                              0.5, "Interview experience", context),
                        ),
                        Expanded(
                          child: _buildCircularProgressBar(
                              0.7, "Salary satisfaction", context),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Job Overview",
                        fontFamily: "ABeeZee",
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: MyText(
                                  text: 'Location: ',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: 'Irvine,CA',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Date Posted: ',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: '2 hours ago',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Expiration Date: ',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: 'Jan 12, 2027',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Location',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: 'Irvine, CA',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Job Title ',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: 'Manager',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Hours',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: '50h / week',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Experience',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: '2+ years',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Rate',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: '\$500 / hour',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Salary',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: '\$2K - \$7K',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: MyText(
                                  text: 'Job Type',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontStyle: FontStyle.normal,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: MyText(
                                    text: 'Full Time',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ABeeZee",
                                    fontStyle: FontStyle.normal,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Job Skills",
                        fontSize: 17,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.left,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Wrap(
                      spacing: 3.0,
                      runSpacing: 3.0,
                      children: <Widget>[
                        CustomChoiceChip(label: 'Problem Solving'),
                        CustomChoiceChip(label: 'Technical skills'),
                        CustomChoiceChip(label: "Android"),
                        CustomChoiceChip(label: "iOS"),
                        CustomChoiceChip(label: "Design"),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: "Location",
                        fontSize: 17,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.left,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
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
                    const SizedBox(height: 10),
                    const Column(
                      children: <Widget>[
                        SavedJobCard(
                          jobTitle: 'Product Designer',
                          companyName: 'Creatio Studio',
                          jobType: 'Fulltime',
                          payment: '8',
                          profileImagePath: 'assets/images/profileimage.jpg',
                        ),
                        SavedJobCard(
                          jobTitle: 'Finance Manager',
                          companyName: 'Complex Studio',
                          jobType: 'Remote',
                          payment: '5',
                          profileImagePath: 'assets/images/profileimage.jpg',
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularProgressBar(
      double progress, String label, BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: 60.0,
              width: 60.0,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 6.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            MyText(
              text: '${(progress * 100).round()}%',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
              fontFamily: "ABeeZee",
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          children: [
            Align(
              alignment: Alignment.center,
              child: MyText(
                text: label,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                fontFamily: "ABeeZee",
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
