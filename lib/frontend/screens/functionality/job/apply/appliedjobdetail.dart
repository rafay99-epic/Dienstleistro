import 'package:dienstleisto/frontend/widgets/choiceChip.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AppliedJobDetail extends StatefulWidget {
  const AppliedJobDetail({super.key});

  @override
  State<AppliedJobDetail> createState() => _AppliedJobDetailState();
}

class _AppliedJobDetailState extends State<AppliedJobDetail> {
  final List<bool> isCompleted = List.generate(6, (index) => false);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {'process': 'Step 1', 'date': '2022-01-01', 'time': '10:00 AM'},
      {'process': 'Step 2', 'date': '2022-01-02', 'time': '11:00 AM'},
      {'process': 'Step 3', 'date': '2022-01-03', 'time': '12:00 PM'},
      {'process': 'Step 4', 'date': '2022-01-04', 'time': '01:00 PM'},
      {'process': 'Step 5', 'date': '2022-01-05', 'time': '02:00 PM'},
      {'process': 'Step 6', 'date': '2022-01-06', 'time': '03:00 PM'},
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: MyText(
          text: 'Applied Job Detail',
          color: Theme.of(context).colorScheme.primary,
          fontFamily: "ABeeZee",
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          fontSize: 17,
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
              const SizedBox(height: 10),
              //Job Card
              const Card(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage(
                        'assets/images/image.jpg'), // Replace with your profile image path
                  ),
                  title: Text('Job Title'), // Replace with your job title
                  subtitle: Text('Location'), // Replace with your location
                ),
              ),
              const SizedBox(height: 10),
              //track Application Title
              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Track Application",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //tracking step timeline
              // Version 02
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 6,
              //   itemBuilder: (context, index) {
              //     return TimelineTile(
              //       isFirst: index == 0,
              //       isLast: index == steps.length - 1,
              //       alignment: TimelineAlign.manual,
              //       lineXY: 0.1,
              //       indicatorStyle: index < 3
              //           ? IndicatorStyle(
              //               width: 20,
              //               iconStyle: IconStyle(
              //                 iconData: Icons.check,
              //                 color: Colors.green,
              //               ),
              //               padding: const EdgeInsets.all(8),
              //             )
              //           : const IndicatorStyle(
              //               width: 20,
              //               color: Colors.grey,
              //               padding: EdgeInsets.all(8),
              //             ),
              //       beforeLineStyle: const LineStyle(
              //         color: Colors.grey,
              //         thickness: 2,
              //       ),
              //       endChild: Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Step ${index + 1}',
              //                 style: const TextStyle(
              //                     fontWeight: FontWeight.bold),
              //               ),
              //               Text(
              //                 '2022-01-0${index + 1} 10:00 AM',
              //                 style: TextStyle(color: Colors.grey),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),

              //version 03:
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 6,
              //   itemBuilder: (context, index) {
              //     return TimelineTile(
              //       isFirst: index == 0,
              //       isLast: index == 6 - 1,
              //       alignment: TimelineAlign.manual,
              //       lineXY: 0.1,
              //       indicatorStyle: index < 3
              //           ? IndicatorStyle(
              //               width: 20,
              //               iconStyle: IconStyle(
              //                 iconData: Icons.check,
              //                 color: Colors.green,
              //               ),
              //               padding: const EdgeInsets.all(8),
              //             )
              //           : const IndicatorStyle(
              //               width: 20,
              //               color: Colors.grey,
              //               padding: EdgeInsets.all(8),
              //             ),
              //       beforeLineStyle: const LineStyle(
              //         color: Colors.grey,
              //         thickness: 2,
              //       ),
              //       endChild: Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Step ${index + 1}',
              //                 style: const TextStyle(
              //                     fontWeight: FontWeight.bold),
              //               ),
              //               Text(
              //                 '2022-01-0${index + 1} 10:00 AM',
              //                 style: TextStyle(color: Colors.grey),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),

              // Version 01:
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   itemCount: 6,
              //   itemBuilder: (context, index) {
              //     return TimelineTile(
              //       isFirst: index == 0,
              //       isLast: index == steps.length - 1,
              //       alignment: TimelineAlign.manual,
              //       lineXY: 0.1,
              //       indicatorStyle: const IndicatorStyle(
              //         width: 20,
              //         color: Colors.blue,
              //         padding: EdgeInsets.all(8),
              //       ),
              //       beforeLineStyle: const LineStyle(
              //         color: Colors.grey,
              //         thickness: 2,
              //       ),
              //       endChild: Card(
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 'Step ${index + 1}',
              //                 style: const TextStyle(
              //                     fontWeight: FontWeight.bold),
              //               ),
              //               Text(
              //                 '2022-01-0${index + 1} 10:00 AM',
              //                 style: TextStyle(color: Colors.grey),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),

              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return TimelineTile(
                      isFirst: index == 0,
                      isLast: index == steps.length - 1,
                      alignment: TimelineAlign.start,
                      // lineXY: 0.1,
                      indicatorStyle: IndicatorStyle(
                        width: 25,
                        color: Colors.green,
                        padding: const EdgeInsets.all(8),
                        iconStyle: IconStyle(
                          iconData: Icons.check,
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                      beforeLineStyle: const LineStyle(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      endChild: SizedBox(
                        height: 70,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 80, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: 'Step ${index + 1}',
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                MyText(
                                  text: '2022-01-0${index + 1} 10:00 AM',
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ABeeZee",
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 10),
              //highlights title

              Align(
                alignment: Alignment.centerLeft,
                child: MyText(
                  text: "Highlights",
                  fontSize: 17,
                  fontFamily: "ABeeZee",
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.left,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              //all the higlights in text
              Container(
                color: Theme.of(context)
                    .colorScheme
                    .background, // Set the background color to white
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
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: MyText(
                              text: 'Irvine,CA',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).colorScheme.primary,
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
                            text: 'Experience: ',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: MyText(
                              text: '2+ years',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).colorScheme.primary,
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
                            text: 'Salary: ',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: MyText(
                              text: '\$2K - \$7L/mo',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).colorScheme.primary,
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
                            text: 'Job Type: ',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: MyText(
                              text: 'Full Time',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).colorScheme.primary,
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
                            text: 'Job Title: ',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            fontFamily: "ABeeZee",
                            fontStyle: FontStyle.normal,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: MyText(
                              text: 'Job Title Value',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: "ABeeZee",
                              fontStyle: FontStyle.normal,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Job skills title
              const SizedBox(height: 20),
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

              //chip clips
              const Wrap(
                spacing: 4.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  CustomChoiceChip(label: 'Problem Solving'),
                  CustomChoiceChip(label: 'Technical Skills'),
                  CustomChoiceChip(label: 'Android '),
                  CustomChoiceChip(label: 'IOS'),
                  CustomChoiceChip(label: 'Design'),
                  CustomChoiceChip(label: 'Website'),
                  CustomChoiceChip(label: 'Mobile'),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
