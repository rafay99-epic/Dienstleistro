// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/about/aboutme.dart';
import 'package:dienstleisto/frontend/screens/home/home.dart';
import 'package:dienstleisto/frontend/screens/jobs/apply/job.dart';
import 'package:dienstleisto/frontend/screens/messages/message.dart';
import 'package:dienstleisto/frontend/screens/notification/notification.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  // const Navbar({super.key});
  const Navbar({Key? key}) : super(key: key);

  @override
  _NavbarState createState() => _NavbarState();
}

// class _NavbarState extends State<Navbar> {
//   int _selectedIndex = 0;

//   void _navgationBottomBar(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<Widget> _pages = [
//     const Home(),
//     const Job(),
//     const Messages(),
//     const NotificationShow(),
//     const AboutMe()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       bottomNavigationBar: Container(
//           color: Theme.of(context).colorScheme.background,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
//             child: GNav(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               activeColor: Theme.of(context).colorScheme.secondary,
//               color: Theme.of(context).colorScheme.inversePrimary,
//               gap: 8,
//               padding: const EdgeInsets.all(16),
//               tabBackgroundColor: Theme.of(context).colorScheme.background,
//               tabs: const [
//                 GButton(
//                   icon: Icons.home,
//                   text: "Home",
//                 ),
//                 GButton(
//                   icon: Icons.work,
//                   text: "Jobs",
//                 ),
//                 GButton(
//                   icon: FontAwesomeIcons.message,
//                   text: "Messaege",
//                 ),
//                 GButton(
//                   icon: Icons.notifications,
//                   text: "Notifications",
//                 ),
//                 GButton(
//                   icon: Icons.person,
//                   text: "Account",
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (int index) {
//                 _navgationBottomBar(index);
//               },
//             ),
//           )),
//       body: Center(
//         child: _pages[_selectedIndex],
//       ),
//     );
//   }
// }

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _navgationBottomBar(int index) {
    _pageController.jumpToPage(index);
  }

  final List<Widget> _pages = [
    const Home(),
    const Job(),
    const Messages(),
    const NotificationShow(),
    const AboutMe()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: GNav(
              backgroundColor: Theme.of(context).colorScheme.background,
              activeColor: Theme.of(context).colorScheme.secondary,
              color: Theme.of(context).colorScheme.inversePrimary,
              gap: 8,
              padding: const EdgeInsets.all(16),
              tabBackgroundColor: Theme.of(context).colorScheme.background,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.work,
                  text: "Jobs",
                ),
                GButton(
                  icon: FontAwesomeIcons.message,
                  text: "Messaege",
                ),
                GButton(
                  icon: Icons.notifications,
                  text: "Notifications",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Account",
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (int index) {
                _navgationBottomBar(index);
              },
            ),
          )),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
