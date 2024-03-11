import 'package:carousel_slider/carousel_slider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String profileImage;
  final String profileTitle;
  final String jobTitle;
  final String location;
  final String payment;
  final String time;
  final VoidCallback onBookmarkTap;

  CardItem({
    required this.profileImage,
    required this.profileTitle,
    required this.jobTitle,
    required this.location,
    required this.payment,
    required this.time,
    required this.onBookmarkTap,
  });
}

class CardSlider extends StatelessWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final bool showShadow;
  final double borderRadius;
  final List<CardItem> items;

  const CardSlider({
    Key? key,
    required this.items,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.showShadow = true,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.15,
        autoPlay: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
      ),
      items: items.map(
        (cardItem) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  boxShadow: showShadow
                      ? [
                          BoxShadow(
                            color: shadowColor,
                            blurRadius: 5.0,
                          ),
                        ]
                      : [],
                ),
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 23,
                                backgroundImage:
                                    AssetImage(cardItem.profileImage),
                              ),
                              const SizedBox(width: 8.0),
                              MyText(
                                text: cardItem.profileTitle,
                                fontSize: 13.0,
                                fontFamily: "ABeeZee",
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.bookmark_border,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            onPressed: cardItem.onBookmarkTap,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyText(
                            text: cardItem.jobTitle,
                            fontSize: 17.0,
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          MyText(
                            text: cardItem.payment,
                            fontSize: 17.0,
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          MyText(
                            text: cardItem.location,
                            fontSize: 13.0,
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          MyText(
                            text: cardItem.time,
                            fontSize: 13.0,
                            fontFamily: "ABeeZee",
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}
