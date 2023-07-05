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
        title: const Text('CURD App'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              title: Text('Product Name'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Code'),
                  Text('Total Price'),
                  Text('Units Availavle'),
                ],
              ),
              leading: Icon(Icons.image),
              trailing: Text('Unit Price'),
            );
          },
      ),
    );
  }
}
