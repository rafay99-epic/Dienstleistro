import 'package:carousel_slider/carousel_slider.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CardSliderCategory extends StatelessWidget {
  const CardSliderCategory({Key? key, required this.items}) : super(key: key);

  final List<CardItemCategoryHome> items;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.1,
        autoPlay: true,
        enlargeCenterPage: false,
        viewportFraction: 1,
        enableInfiniteScroll: false,
      ),
      items: items.map(
        (cardItem) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Center(
                        child: Icon(
                          cardItem.icon,
                          size: 40,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    MyText(
                      text: cardItem.categoryTitle,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w400,
                      fontFamily: "ABeeZee",
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ).toList(),
    );
  }
}

class CardItemCategoryHome {
  final IconData icon;
  final String categoryTitle;
  final VoidCallback onTap;

  CardItemCategoryHome({
    required this.categoryTitle,
    required this.icon,
    required this.onTap,
  });
}
