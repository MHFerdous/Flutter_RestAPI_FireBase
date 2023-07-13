import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 150,
                  height: 20,
                  child: FittedBox(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    child: Text('Displaying text on the screen'),
                  ),
                ),
                Text('Displaying text on the screen'),
              ],
            ),
            SizedBox(
              height: size.height / 10,
            ),
             //FractionallySizedBox(heightFactor: ,),
            Container(
              color: Colors.green,
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
