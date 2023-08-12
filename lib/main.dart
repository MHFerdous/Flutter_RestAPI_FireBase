import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application/home_screen.dart';

void main() {
  runApp(
    const CartApp(),
  );
}

class CartApp extends StatelessWidget {
  const CartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}
