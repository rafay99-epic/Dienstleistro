import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String backgroundImage;
  final String country;
  final String place;

  const LocationCard({
    super.key,
    required this.backgroundImage,
    required this.country,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          Ink.image(
            image: NetworkImage(backgroundImage),
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  country,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      place,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
