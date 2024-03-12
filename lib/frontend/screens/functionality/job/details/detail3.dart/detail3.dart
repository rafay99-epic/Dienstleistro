import 'package:dienstleisto/frontend/widgets/cardSlider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rating_summary/rating_summary.dart';

class Job3Detail extends StatefulWidget {
  const Job3Detail({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Job3DetailState createState() => _Job3DetailState();
}

class _Job3DetailState extends State<Job3Detail> {
  final List<String> imageList = [
    'https://images.unsplash.com/photo-1522252234503-e356532cafd5?q=80&w=1025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1678565869434-c81195861939?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1587620962725-abab7fe55159?q=80&w=1031&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // Add more image URLs as needed
  ];

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
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle options button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'About',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    MyText(
                      text:
                          'From the glamorous San Francisco social scene of the 1920s, through war and the social changes of the ’60s, to the rise of Silicon Valley today, this extraordinary novel takes us on a family odyssey that is both heartbr…. read more',
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontStyle: FontStyle.italic,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MyText(
                          text: "Photos",
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
                    SizedBox(
                      height: 200, // Adjust this value as needed
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Overview',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: MyText(
                                  text: 'Industry ',
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
                                    text: 'Design & Creative',
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
                                  text: 'Company Size ',
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
                                    text: '100-500',
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
                                  text: 'Phone',
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
                                    text: '123 456 7890',
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
                                  text: 'Email',
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
                                    text: 'hello@mail.com',
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
                                  text: 'Location ',
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
                                    text: 'San Francisco, CA',
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
                                  text: 'Website',
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
                                    text: 'vacantland.com',
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Headquaters',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: MyText(
                                text:
                                    '43 Bourke Street, Newbridge NSW 837 Raffles Place, Boat Band M83',
                                fontSize: 15.0,
                                fontFamily: "ABeeZee",
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.navigation),
                              color: Theme.of(context).colorScheme.secondary,
                              onPressed: () {
                                // Handle navigation button press
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Watch Video',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    //youtube vide play

                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Social Media',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    //social media links
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.facebook,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          onPressed: () {
                            // Handle Facebook button press
                          },
                        ),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          onPressed: () {
                            // Handle Instagram button press
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.youtube_searched_for,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          onPressed: () {
                            // Handle YouTube button press
                          },
                        ),
                        IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.twitch,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          onPressed: () {
                            // Handle Twitter button press
                          },
                        ),
                      ],
                    ),

                    //Job aviablie title
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MyText(
                          text: "Available Jobs",
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
                    // job aviable sliders
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MyText(
                        text: 'Reviews',
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.italic,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 20),
                    RatingSummary(
                      counter: 13,
                      average: 3.846,
                      showAverage: true,
                      counterFiveStars: 5,
                      counterFourStars: 4,
                      counterThreeStars: 2,
                      counterTwoStars: 1,
                      counterOneStars: 1,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      color: Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontFamily: "ABeeZee",
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
