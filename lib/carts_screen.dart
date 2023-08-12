import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartsScreen extends StatelessWidget {
  const CartsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back(
                  result: Params('Ferdous', 22),
                );

                /// Navigator.pop
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class Params {
  final String name;
  final int age;

  Params(this.name, this.age);
}
