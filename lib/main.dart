import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(appName: 'Hello App'),
  );
}

class MyApp extends StatelessWidget {
  final String appName;

  const MyApp({super.key, required this.appName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Intro to widgets',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            wordSpacing: 0.5,
            letterSpacing: 0.5,
            fontSize: 20,
            decoration: TextDecoration.underline,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
        ],
        backgroundColor: Colors.black38,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Hello Ferdous')],
        ),
      ),
    );
  }
}
