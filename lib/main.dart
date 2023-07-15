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
  List<String> students = [
    'Ferdous',
    'Rafi',
    'Talha',
    'Sakib',
    'Hasan',
    'Kamran',
    'Rahat',
    'MH Ferdous',
    'MH Ferdous',
    'MH Ferdous',
    'MH Ferdous',
    'MH Ferdous',
    'MH Ferdous',
    'MH Ferdous',
  ];

  Map<int, String> universities = {
    1: 'SUST',
    2: 'LU',
    3: 'MU',
    4: 'SUST',
    5: 'LU',
    6: 'MU',
    7: 'SUST',
    8: 'LU',
    9: 'MU',
    10: 'SUST',
    11: 'LU',
    12: 'MU',
    13: 'SUST',
    14: 'LU',
    15: 'MU',
  };

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
      /*body: ListView.separated(
          itemCount: students.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(students[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 0,
              color: Colors.red,
            );
          },
        ),);*/
      body: SingleChildScrollView(
        child: Column(
          children: [
            Scrollbar(
              thickness: 10,
              child: ListView.separated(
                itemCount: universities.length,
                primary: false,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      universities.values.elementAt(index).toString(),
                    ),
                    subtitle: Text(
                      universities.keys.elementAt(index).toString(),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 0,
                    color: Colors.red,
                  );
                },
              ),
            ),
            SizedBox(
              height: 200,
              width: 2000,
              child: ListView.builder(
                itemCount: students.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Text(students[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
