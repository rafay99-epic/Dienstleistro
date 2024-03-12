import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // late GoogleMapController mapController;

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar()
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: Text('Maps Sample App'),
        //     backgroundColor: Colors.green[700],
        //   ),
        //   body: GoogleMap(
        //     onMapCreated: _onMapCreated,
        //     initialCameraPosition: CameraPosition(
        //       target: const LatLng(0, 0), // Set this to your desired coordinates
        //       zoom: 11.0,
        //     ),
        //   ),
        // ),
        );
  }
}
