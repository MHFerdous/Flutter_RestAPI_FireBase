import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('Title:'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price:'),
                  SizedBox(height: 100, child: Text('Description: ')),
                ],
              ),
              trailing: Image.network(
                  'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=400'),
            ),
            ListTile(
              title: const Text('Title:'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price:'),
                  SizedBox(height: 100, child: Text('Description: ')),
                ],
              ),
              trailing: Image.network(
                  'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=400'),
            ),
            ListTile(
              title: const Text('Title:'),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price:'),
                  SizedBox(height: 100, child: Text('Description: ')),
                ],
              ),
              trailing: Image.network(
                  'https://images.pexels.com/photos/577585/pexels-photo-577585.jpeg?auto=compress&cs=tinysrgb&w=400'),
            ),
          ],
        ),
      ),
    );
  }
}
