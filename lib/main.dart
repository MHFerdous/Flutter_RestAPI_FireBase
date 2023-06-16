import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/counter_screen.dart';

void main() {
  runApp(
    const MyApp(
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
      home: const CounterScreen(),
    );
  }
}

/*
class GoodScreen extends StatefulWidget {
  const GoodScreen({Key? key}) : super(key: key);

  @override
  State<GoodScreen> createState() => _GoodScreenState();
}

class _GoodScreenState extends State<GoodScreen> {
  String welcomeMessage = 'HI';

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
          welcomeMessage,
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          welcomeMessage = welcomeMessage == 'HI' ? 'HELLO' : 'HI';
          print(welcomeMessage);
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
*/
