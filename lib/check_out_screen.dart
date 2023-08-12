import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application/home_screen.dart';

class CheckOutScreen extends StatelessWidget {
  final String massage;
  const CheckOutScreen({Key? key, required this.massage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Massage: $massage'),
            ElevatedButton(
              onPressed: () {
                Get.offAll(
                  const HomeScreen(),

                  /// Navigator.replaceAll
                );
              },
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
