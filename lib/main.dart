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
            markerId: const MarkerId('custom-marker-1'),
            position: const LatLng(24.903620543261248, 91.8743689416879),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            infoWindow: const InfoWindow(title: 'Point 1'),
            draggable: true,
            onDragStart: (LatLng l) {
              print('Drag started at $l');
            },
            onDragEnd: (LatLng l) {
              print('Drag ended at $l');
            },
          ),
          Marker(
            markerId: const MarkerId('custom-marker-2'),
            position: const LatLng(24.90709443035354, 91.8723817500344),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            infoWindow: const InfoWindow(title: 'Point 2'),
            draggable: true,
            onDragStart: (LatLng l) {
              print('Drag started at $l');
            },
            onDragEnd: (LatLng l) {
              print('Drag ended at $l');
            },
          ),
          Marker(
            markerId: const MarkerId('custom-marker-3'),
            position: const LatLng(24.904446459123044, 91.87630502663893),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: const InfoWindow(title: 'Point 3'),
            draggable: true,
            onDragStart: (LatLng l) {
              print('Drag started at $l');
            },
            onDragEnd: (LatLng l) {
              print('Drag ended at $l');
            },
          ),
        },
        polylines: <Polyline>{
          Polyline(
            polylineId: const PolylineId('polyline'),
            color: Colors.black,
            jointType: JointType.round,
            width: 5,
            onTap: () {
              print('Tapped on polyline');
            },
            points: const [
              LatLng(24.903620543261248, 91.8743689416879),
              LatLng(24.90709443035354, 91.8723817500344),
              LatLng(24.904446459123044, 91.87630502663893),
            ],
          )
        },
        circles: <Circle>{
          Circle(
            circleId: const CircleId('demo-1'),
            center: const LatLng(24.903620543261248, 91.8743689416879),
            radius: 40,
            strokeColor: Colors.black,
            strokeWidth: 4,
            fillColor: Colors.purple.shade100,
            onTap: () {
              print('Tapped on circle 1');
            },
          ),
          Circle(
            circleId: const CircleId('demo-2'),
            center: const LatLng(24.90709443035354, 91.8723817500344),
            radius: 40,
            strokeColor: Colors.black,
            strokeWidth: 4,
            fillColor: Colors.purple.shade100,
            onTap: () {
              print('Tapped on circle 2');
            },
          ),
          Circle(
            circleId: const CircleId('demo-3'),
            center: const LatLng(24.904446459123044, 91.87630502663893),
            radius: 40,
            strokeColor: Colors.black,
            strokeWidth: 4,
            fillColor: Colors.purple.shade100,
            onTap: () {
              print('Tapped on circle 3');
            },
          )
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: const PolygonId('poly-id'),
            fillColor: Colors.pinkAccent.shade400,
            strokeWidth: 0,
            onTap: () {
              print('Tapped on polygon');
            },
            points: const [
              LatLng(24.898735801885454, 91.88342150674545),
              LatLng(24.898187736039088, 91.8824522285185),
              LatLng(24.89758257717364, 91.88340891871651),
              LatLng(24.898244826344957, 91.88415161242287),
            ],
          )
        },
      ),
    );
  }
}
