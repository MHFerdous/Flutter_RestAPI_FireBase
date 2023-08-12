import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application/counter_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CounterController _counterController = Get.put(
    CounterController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _counterController.increment();
                _counterController.decrement();
                Get.to(
                  CounterScreen(),

                  /// Navigator.push
                );
              },
              child: const Text('Counter Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
