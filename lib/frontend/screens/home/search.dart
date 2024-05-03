// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/frontend/screens/jobs/apply/savedCard.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search for everything...',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none, // Remove the default border
                        ),
                      ),
                    ),
                  ),
                  // if (searchText.isNotEmpty)
                  TextButton(
                    child: MyText(
                      text: 'Cancel',
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        searchText = '';
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TabBar(
                tabs: [
                  Tab(
                    child: MyText(
                      text: 'All Categories',
                      fontFamily: 'ABeeZee',
                      // fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ), // Replace with your font family, font size, and color
                  Tab(
                    child: MyText(
                      text: 'Develop',
                      fontFamily: 'ABeeZee',
                      // fontSize: 15,s
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ), // Replace with your font family, font size, and color
                  Tab(
                    child: MyText(
                      text: 'Banking',
                      fontFamily: 'ABeeZee',
                      // fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ), // Replace with your font family, font size, and color
                  Tab(
                    child: MyText(
                      text: 'Engineer',
                      fontFamily: 'ABeeZee',
                      // fontSize: 15,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _tab1Content(),
                  const Center(child: Text('Tab 2 Content')),
                  const Center(child: Text('Tab 3 Content')),
                  const Center(child: Text('Tab 4 Content')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _tab1Content() {
  return const Padding(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Column(
      children: <Widget>[
        SizedBox(height: 10),
        SavedJobCard(
          jobTitle: 'Product Designer',
          companyName: 'Creatio Studio',
          jobType: 'Fulltime',
          payment: '8',
          profileImagePath: 'assets/images/profileimage.jpg',
        ),
        SavedJobCard(
          jobTitle: 'Finance Manager',
          companyName: 'Complex Studio',
          jobType: 'Remote',
          payment: '5',
          profileImagePath: 'assets/images/profileimage.jpg',
        ),
      ],
    ),
  );
}
