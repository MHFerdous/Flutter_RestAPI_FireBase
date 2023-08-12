import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_application/carts_screen.dart';
import 'package:mobile_application/check_out_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
              onPressed: () async {
                final Params? result = await Get.to(
                  const CartsScreen(),

                  /// Navigator.push
                );
                if (result != null) {
                  print(result.name);
                  print(result.age);
                }
              },
              child: const Text('Carts'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.off(
                  const CheckOutScreen(
                    massage: 'Hello',
                  ),

                  /// Navigator.replace
                );
              },
              child: const Text('Check Out'),
            ),
          ],
        ),
      ),
    );
  }
}
