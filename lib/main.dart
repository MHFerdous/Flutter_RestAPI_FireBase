import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(appName: 'Hello App'),
  );
}

class MyApp extends StatelessWidget {
  final String appName;

  const MyApp({required this.appName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appName, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Intro to widgets',
          textAlign: TextAlign.start,
        ),
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
                alignment: Alignment.center,
              ),
              Positioned(
                bottom: 20,
                right: 20,
                left: 20,
                top: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.redAccent,
                ),
              ),
              Positioned(
                bottom: 40,
                right: 40,
                left: 40,
                top: 40,
                child: Container(
                  /*width: 25,
                    height: 25,*/
                  color: Colors.black,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Hello Ferdous',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
