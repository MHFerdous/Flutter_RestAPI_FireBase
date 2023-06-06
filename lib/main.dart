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
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: appName, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(
          'Home Screen',
        ),
        elevation: 3,
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: [
          Icon(Icons.add),
          Icon(Icons.search),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello Ferdous'),
          Image.asset("assets/images/R.jpeg", height: 200, width: 200),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.blueGrey),
                accountName: Text(
                  'Mess Name',
                  style: TextStyle(color: Colors.white),
                ),
                accountEmail: Text('messSylhet2023@gmail.com',
                    style: TextStyle(color: Colors.white)),
                currentAccountPicture: Image.network(
                    'https://cdn0.iconfinder.com/data/icons/education-school-science/100/29-512.png'),
                //currentAccountPictureSize: Size.square(150),
              )),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            hoverColor: Colors.grey,
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            hoverColor: Colors.grey,
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Contact with Manager'),
            hoverColor: Colors.grey,
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.report_gmailerrorred_outlined),
            title: Text('Report to Manager'),
            hoverColor: Colors.grey,
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('About'),
            hoverColor: Colors.grey,
            onTap: () {},
          ),
        ]),
      ),
    );
  }
}
