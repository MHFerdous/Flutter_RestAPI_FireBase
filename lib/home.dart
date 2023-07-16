import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: Column(
        children: [
          Placeholder(
            child: Image.network('https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/lioness-displaying-dangerous-teeth-in-a-rainstorm-johan-swanepoel.jpg'),
          )
        ],
      ),

    );
  }
}
