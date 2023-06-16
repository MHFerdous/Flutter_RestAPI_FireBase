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
      home: GoodScreen(),
    );
  }
}

/*class HomeScreen extends StatelessWidget {
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
}*/

class GoodScreen extends StatefulWidget {
  const GoodScreen({Key? key}) : super(key: key);

  @override
  State<GoodScreen> createState() => _GoodScreenState();
}

class _GoodScreenState extends State<GoodScreen> {
  String welcomeMessege = 'HI';

  @override
  void initState() {
    super.initState();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant GoodScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text(
          welcomeMessege,
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          welcomeMessege = welcomeMessege == 'HI' ? 'HELLO' : 'HI';
          print(welcomeMessege);
          setState(() {});
        },
        label: Text('press me'),
      ),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
