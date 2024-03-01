import 'package:carousel_slider/carousel_slider.dart';
import 'package:dienstleisto/frontend/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardItem {
  final Widget item;
  final String title;
  final String location;
  final double initialRating;
  final String subscriptionText;
  final String buttonText;
  final VoidCallback onCardTap;
  final VoidCallback onButtonTap;

  CardItem({
    required this.item,
    required this.title,
    required this.location,
    required this.initialRating,
    required this.subscriptionText,
    required this.buttonText,
    required this.onCardTap,
    required this.onButtonTap,
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
        height: 450.0,
        autoPlay: true,
        enlargeCenterPage: false,
        enableInfiniteScroll: false,
      ),
      items: items.map((cardItem) {
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
                  width: 2.0,
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
              child: GestureDetector(
                onTap: cardItem.onCardTap,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FaIcon(FontAwesomeIcons.arrowsLeftRight),
                            FaIcon(
                              FontAwesomeIcons.heart,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              // ClipOval(
                              //   child: cardItem.item,
                              // ),
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(100),
                              //   child: SizedBox(
                              //     width: 200,
                              //     height: 200,
                              //     child: cardItem.item,
                              //   ),
                              // ),
                              ClipOval(
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: cardItem.item,
                                ),
                              ),

                              const SizedBox(height: 5),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      cardItem.location,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RatingBar.builder(
                                    initialRating: cardItem.initialRating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                cardItem.subscriptionText,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomButton(
                                onPressed: cardItem.onButtonTap,
                                text: cardItem.buttonText,
                                enableIcon: false,
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
