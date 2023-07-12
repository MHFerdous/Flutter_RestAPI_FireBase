///import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Widgets'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.teal,
              height: 100,
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                'Hello Ferdous',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.limeAccent,
                border: Border.all(color: Colors.black87, width: 5),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(
                'Hello Ferdous',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.access_alarm,
              color: Colors.black,
              size: 50,
              fill: 1,
            ),
            Image.network(
              ///  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              'https://1.bp.blogspot.com/-N9urImzUkzw/UWjpuBgRnoI/AAAAAAAA_Qc/SJNkxoaCBRc/s1600/NATOT133.JPG',
              width: 500,
              height: 100,
              fit: BoxFit.contain,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/R.jpeg',
                width: 500,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
