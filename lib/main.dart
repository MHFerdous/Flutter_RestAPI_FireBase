import 'package:flutter/material.dart';
import 'package:location/location.dart';

void main() {
  runApp(
    const GPSLocationApp(),
  );
}

class GPSLocationApp extends StatelessWidget {
  const GPSLocationApp({Key? key}) : super(key: key);

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
  void getMyLocation() async{
    LocationData location = await Location.instance.getLocation();
    print(location);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Location'),
      ),
      body: Center(
        child: Text('My location'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getMyLocation();
        },
        child: const Icon(Icons.my_location_outlined),
      ),
    );
  }
}
