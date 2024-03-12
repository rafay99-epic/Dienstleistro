import 'package:dienstleisto/frontend/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomInfoWidget extends StatelessWidget {
  final String imagePath;
  final String jobTitle;
  final String studio;
  final String location;
  final double rating;
  final int ratingCount;
  final VoidCallback onShareTap;
  final VoidCallback onBookmarkTap;

  const CustomInfoWidget({
    Key? key,
    required this.imagePath,
    required this.jobTitle,
    required this.studio,
    required this.location,
    required this.rating,
    required this.ratingCount,
    required this.onShareTap,
    required this.onBookmarkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: onShareTap,
              ),
              const SizedBox(width: 60),
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 30,
              ),
              const SizedBox(width: 60),
              IconButton(
                icon: const Icon(Icons.bookmark_border),
                onPressed: onBookmarkTap,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        MyText(
          text: jobTitle,
          fontFamily: "ABeeZee",
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              MyText(
                text: studio,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Icon(
                Icons.location_on,
                size: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(width: 10),
              MyText(
                text: location,
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15.0,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              const SizedBox(width: 10),
              MyText(
                text: '$rating ($ratingCount ratings)',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'ABeeZee',
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
