import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String backgroundImage;
  final String profileImage;
  final String companyName;
  final String title;
  final String location;
  final String price;
  final String type;

  const ProfileCard({
    super.key,
    required this.backgroundImage,
    required this.profileImage,
    required this.companyName,
    required this.title,
    required this.location,
    required this.price,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Ink.image(
              image: NetworkImage(backgroundImage),
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(profileImage),
                        ),
                        const SizedBox(width: 10),
                        MyText(
                          text: companyName,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    MyText(
                      text: title,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 34,
                      textAlign: TextAlign.left,
                      fontFamily: "ABeeZee",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        const SizedBox(
                            width:
                                5), // Add some space between the icon and the text
                        MyText(
                          text: location,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        MyText(
                          text: price,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(width: 10),
                        MyText(
                          text: type,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
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

class ProfileCardSlider extends StatelessWidget {
  final List<ProfileCard> cards;

  const ProfileCardSlider({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return cards[index];
        },
      ),
    );
  }
}
