// import 'package:flutter/material.dart';

// class ProfileItem {
//   final String profileImage;
//   final String profileTitle;
//   final String jobTitle;
//   final String location;
//   final String payment;
//   final String time;
//   final VoidCallback onBookmarkTap;

//   ProfileItem({
//     required this.profileImage,
//     required this.profileTitle,
//     required this.jobTitle,
//     required this.location,
//     required this.payment,
//     required this.time,
//     required this.onBookmarkTap,
//   });
// }

// class ProfileList extends StatelessWidget {
//   final Color backgroundColor;
//   final List<ProfileItem> items;

//   const ProfileList({
//     Key? key,
//     required this.items,
//     this.backgroundColor = Colors.white,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         var profileItem = items[index];
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: const EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Card(
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         CircleAvatar(
//                           radius: 23,
//                           backgroundImage:
//                               NetworkImage(profileItem.profileImage),
//                         ),
//                         const SizedBox(width: 8.0),
//                         Text(
//                           profileItem.profileTitle,
//                           style: TextStyle(
//                             fontSize: 13.0,
//                             fontFamily: "ABeeZee",
//                             fontWeight: FontWeight.w400,
//                             fontStyle: FontStyle.italic,
//                             color: Theme.of(context).colorScheme.inversePrimary,
//                           ),
//                         ),
//                       ],
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.bookmark_border,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       onPressed: profileItem.onBookmarkTap,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       profileItem.jobTitle,
//                       style: TextStyle(
//                         fontSize: 17.0,
//                         fontFamily: "ABeeZee",
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.italic,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                     Text(
//                       profileItem.payment,
//                       style: TextStyle(
//                         fontSize: 17.0,
//                         fontFamily: "ABeeZee",
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.italic,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       profileItem.location,
//                       style: TextStyle(
//                         fontSize: 13.0,
//                         fontFamily: "ABeeZee",
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.italic,
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                       ),
//                     ),
//                     Text(
//                       profileItem.time,
//                       style: TextStyle(
//                         fontSize: 13.0,
//                         fontFamily: "ABeeZee",
//                         fontWeight: FontWeight.w400,
//                         fontStyle: FontStyle.italic,
//                         color: Theme.of(context).colorScheme.inversePrimary,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';

class ProfileItem {
  final String profileImage;
  final String profileTitle;
  final String jobTitle;
  final String location;
  final String payment;
  final String time;
  final VoidCallback onBookmarkTap;

  ProfileItem({
    required this.profileImage,
    required this.profileTitle,
    required this.jobTitle,
    required this.location,
    required this.payment,
    required this.time,
    required this.onBookmarkTap,
  });
}

class ProfileList extends StatelessWidget {
  final Color backgroundColor;
  final List<ProfileItem> items;

  const ProfileList({
    Key? key,
    required this.items,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((profileItem) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
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
                              NetworkImage(profileItem.profileImage),
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          profileItem.profileTitle,
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
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: profileItem.onBookmarkTap,
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      profileItem.jobTitle,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      profileItem.payment,
                      style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      profileItem.location,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontFamily: "ABeeZee",
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      profileItem.time,
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
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
