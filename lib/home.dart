import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'S',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'M',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'L',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'XL',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'XXL',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });

                  },
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 70,
                    decoration: pressed
                        ? const BoxDecoration(color: Colors.amber)
                        : BoxDecoration(color: Colors.grey.shade500),
                    alignment: Alignment.center,
                    child: Text(
                      'XXXL',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
