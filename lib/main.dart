import 'package:flutter/material.dart';
import 'package:mobile_application/home.dart'; // package import
// import 'home.dart'; // relative import

main() {
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
