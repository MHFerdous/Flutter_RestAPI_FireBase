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
  const MyApp({super.key, required this.appName});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      home: const CounterScreen(),
    );
  }
}
