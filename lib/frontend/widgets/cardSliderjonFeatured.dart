import 'package:carousel_slider/carousel_slider.dart';
import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class CardItemFeatureJob {
  final String profileImage;
  final String profileTitle;
  final String description;
  final String location;

  CardItemFeatureJob({
    required this.profileImage,
    required this.profileTitle,
    required this.description,
    required this.location,
  });
}

class CardSlider2Home extends StatelessWidget {
  final Color backgroundColor;
  final Color shadowColor;
  final bool showShadow;
  final double borderRadius;
  final List<CardItemFeatureJob> items;

  const CardSlider2Home({
    Key? key,
    required this.items,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.showShadow = true,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.5),
        itemCount: items.length,
        itemBuilder: (context, index) {
          CardItemFeatureJob cardItem = items[index];
          return Container(
            width: 150,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 23,
                    backgroundImage: AssetImage(cardItem.profileImage),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    cardItem.profileTitle,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    cardItem.description,
                    style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    cardItem.location,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


// class CardSlider2Home extends StatelessWidget {
//   final Color backgroundColor;
//   final Color shadowColor;
//   final bool showShadow;
//   final double borderRadius;
//   final List<CardItemFeatureJob> items;

//   const CardSlider2Home({
//     Key? key,
//     required this.items,
//     this.backgroundColor = Colors.white,
//     this.shadowColor = Colors.grey,
//     this.showShadow = true,
//     this.borderRadius = 10.0,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: MediaQuery.of(context).size.height * 0.20,
//         autoPlay: true,
//         viewportFraction: 0.5,
//         enlargeCenterPage: false,
//         enableInfiniteScroll: false,
//       ),
//       items: items.map(
//         (cardItem) {
//           return Container(
//             width: 150,
//             margin: const EdgeInsets.symmetric(horizontal: 5.0),
//             child: Card(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   CircleAvatar(
//                     radius: 23,
//                     backgroundImage: AssetImage(cardItem.profileImage),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     cardItem.profileTitle,
//                     style: TextStyle(
//                       fontSize: 17.0,
//                       fontFamily: "ABeeZee",
//                       fontWeight: FontWeight.w400,
//                       fontStyle: FontStyle.italic,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                   ),
//                   Text(
//                     cardItem.description,
//                     style: TextStyle(
//                       fontSize: 17.0,
//                       fontFamily: "ABeeZee",
//                       fontWeight: FontWeight.w400,
//                       fontStyle: FontStyle.italic,
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   Text(
//                     cardItem.location,
//                     style: TextStyle(
//                       fontSize: 13.0,
//                       fontFamily: "ABeeZee",
//                       fontWeight: FontWeight.w400,
//                       fontStyle: FontStyle.italic,
//                       color: Theme.of(context).colorScheme.inversePrimary,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ).toList(),
//     );
//   }
// }
