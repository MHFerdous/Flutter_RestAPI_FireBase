import 'package:flutter/material.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cancel_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
          ),
        ],
      ),
    );
  }
}
