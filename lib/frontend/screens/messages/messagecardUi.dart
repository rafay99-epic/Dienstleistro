import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

// Version 05:

class MessageCard extends StatelessWidget {
  final String profileImage;
  final String messagerName;
  final String message;
  final String time;
  final bool isActive;
  final int unreadMessages;

  final VoidCallback onTap;

  const MessageCard({
    Key? key,
    required this.message,
    required this.onTap,
    required this.profileImage,
    required this.messagerName,
    required this.time,
    required this.isActive,
    required this.unreadMessages,
    // required String name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: ListTile(
          leading: Stack(
            children: <Widget>[
              CircleAvatar(
                radius: 22.5,
                backgroundImage: NetworkImage(profileImage),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.green : Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: MyText(
            text: messagerName,
            fontFamily: "ABeeZee",
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Theme.of(context).colorScheme.primary,
          ),
          subtitle: MyText(
            text: message,
            fontFamily: "ABeeZee",
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              MyText(
                text: time,
                fontFamily: "ABeeZee",
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Theme.of(context).colorScheme.inversePrimary,
                textAlign: TextAlign.right,
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: MyText(
                    text: '$unreadMessages',
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    fontSize: 16, // Increase the font size
                    color: Colors.white, // Change the color to white
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
