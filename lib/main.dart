import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      appName: 'Hello App',
    ),
  );
}

class MyApp extends StatelessWidget {
  final String appName;
  const MyApp({required this.appName});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
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
        title: Text('My App'),
      ),
      body: Center(
        child: Text('Hi'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('press me'
            ''),
      ),
    );
  }
}




class GoodScreen extends StatefulWidget {
  const GoodScreen({Key? key}) : super(key: key);

  @override
  State<GoodScreen> createState() => _GoodScreenState();
}

class _GoodScreenState extends State<GoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
