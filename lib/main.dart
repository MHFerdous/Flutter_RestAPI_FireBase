import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          zoom: 15,
          bearing: 30,
          tilt: 10,
          target: LatLng(24.906023528581933, 91.88052413131356),
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        trafficEnabled: true,
        compassEnabled: true,
        onTap: (LatLng l) {
          print('Tapped on $l');
        },
        onMapCreated: (GoogleMapController? controller) {
          print('Map has been created');
          _googleMapController = controller!;
        },
        onLongPress: (LatLng l) {
          print('Long pressed on $l');
        },
        mapType: MapType.normal,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('custom-marker'),
            position: const LatLng(24.905078740070348, 91.86985092439234),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: const InfoWindow(title: 'Point'),
            draggable: true,
            onDragStart: (LatLng l) {
              print('Drag started at $l');
            },
            onDragEnd: (LatLng l) {
              print('Drag ended at $l');
            },
          ),
        },
      ),
    );
  }
}
