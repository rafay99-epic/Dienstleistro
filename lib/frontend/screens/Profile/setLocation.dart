// ignore_for_file: library_private_types_in_public_api

import 'package:dienstleisto/backend/permission/location.dart';
import 'package:dienstleisto/frontend/screens/Profile/ChooseLanguage.dart';
import 'package:dienstleisto/frontend/screens/Profile/setManuallLocation.dart';
import 'package:dienstleisto/constants/widgets/button.dart';
import 'package:dienstleisto/constants/widgets/textStyle.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:page_transition/page_transition.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  //location acess service
  LocationService locationService = LocationService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.15, width: size.width * 0.5),
                //location logo or icon
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 80,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //hello, nice to meet you your ? title

                Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Hello, nice to',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                            fontStyle: FontStyle.italic,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                        TextSpan(
                          text: '\nmeet you!',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.primary,
                            fontStyle: FontStyle.italic,
                            fontFamily: "ABeeZee",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //set yout location tostart find a dream jon around you
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text:
                        "Set your location to start find a dream job around you",
                    fontSize: 17,
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                //button for detect and ask for location permissions
                const SizedBox(height: 30),
                CustomButton(
                  onPressed: () async {
                    LocationData? locationData =
                        await locationService.requestLocationPermission();
                    if (locationData != null) {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const ChooseLanguage(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    }
                  },
                  text: "Use current location",
                  enableIcon: true,
                  icon: FontAwesomeIcons.locationArrow,
                  iconColor: Theme.of(context).colorScheme.background,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  buttonTextColor: Theme.of(context).colorScheme.background,
                  buttonTextSize: 17,
                  buttonTextAlign: TextAlign.center,
                  buttonTextFontFamily: 'ABeeZee',
                  buttonTextfontStyle: FontStyle.italic,
                ),
                //we only access your location while you are using the applications. ? text
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text:
                        "We only access your location while you are using the applications",
                    fontSize: 13,
                    fontFamily: "ABeeZee",
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.left,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                //button for set location manually
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      // Handle the tap.
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftWithFade,
                          child: const MapScreen(),
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    },
                    child: MyText(
                      text: "or set your location manually",
                      fontSize: 17,
                      fontFamily: "ABeeZee",
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.left,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
