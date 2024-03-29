// ignore_for_file: use_build_context_synchronously

import 'package:dienstleisto/frontend/screens/home/home1Tab.dart';
import 'package:dienstleisto/frontend/screens/home/search.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: Theme.of(context).colorScheme.secondary,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Find your dream jon in',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.background,
                                fontStyle: FontStyle.italic,
                                fontFamily: "ABeeZee",
                              ),
                            ),
                            TextSpan(
                              text: '\nSan Francisco',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).colorScheme.background,
                                fontStyle: FontStyle.italic,
                                fontFamily: "ABeeZee",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      readOnly:
                          true, // Make TextField read-only to ensure onTap is always triggered
                      onTap: () {
                        // Handle tap event here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Search(),
                          ),
                        );
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.background,
                        hintText: 'Search for everything...',
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TabBar(
                    indicatorColor: Theme.of(context).colorScheme.background,
                    labelColor: Theme.of(context).colorScheme.background,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.background,
                    isScrollable: false,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'All Categories'),
                      Tab(text: 'Developer'),
                      Tab(text: 'Banking'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 500,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  Tab01(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
