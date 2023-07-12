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
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.indigo,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.lightGreen,
                    ),
                  )
                ],
              ),
            ),
          ),
          /*Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          Flexible(
            //fit: FlexFit.tight,
            child: Container(
              width: 100,
              //height: 100,
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 100,
              //height: 100,
              color: Colors.blue,
            ),
          ),*/

          Flexible(
            fit: FlexFit.tight,
            child: Container(
              color: Colors.cyanAccent,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.indigo,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightGreen,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.pinkAccent,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.indigo,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.lightGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.grey.shade700,
                builder: (context) {
                  return AlertDialog(
                    shadowColor: Colors.grey,
                    titlePadding: const EdgeInsets.all(10),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Message'),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Hey Welcome'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Thanks'),
                      ),
                    ],
                    contentPadding: const EdgeInsets.all(25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              );
            },
            label: const Text('Dialog'),
          ),
        ],
      ),
    );
  }
}

