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
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            wordSpacing: 0.5,
            letterSpacing: 0.5,
            fontSize: 20,
            //decoration: TextDecoration.underline,
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
          children: [
            ListTile(
              onTap: () {
                print('tapped');
              },
              title: Text('User Name'),
              subtitle: Text('Designation'),
              leading: Icon(Icons.account_circle_rounded),
              trailing: Icon(Icons.volume_mute_rounded),
              tileColor: Colors.grey.shade300,
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              //direction: Axis.vertical,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Hello'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
