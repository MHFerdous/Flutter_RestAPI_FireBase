import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.settings),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
