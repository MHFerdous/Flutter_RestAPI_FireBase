import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MYCounterApp(),
  );
}

class MYCounterApp extends StatelessWidget {
  const MYCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CounterController counterController = Get.put(
    CounterController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            counterController.count.toString(),
            style: const TextStyle(fontSize: 100),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterController extends GetxController {
  RxInt count = 0.obs;

  void increment() {
    count++;
  }
}
