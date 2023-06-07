import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
        appBar: AppBar(
          title: Text('Basic Widgets'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.mail),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        minimumSize: Size(50, 50),
                        maximumSize: Size(100, 100),
                        elevation: 15,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        shadowColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                          side: BorderSide(color: Colors.green, width: 3),
                        )),
                    onPressed: () {},
                    child: Text('Button')),
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white24,
                        elevation: 15,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        )),
                    onPressed: () {},
                    child: Text('Text Button')),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 15),
                      elevation: 15,
                      shadowColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: Text('Outlineed Button')),
                OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 15),
                      elevation: 15,
                      shadowColor: Colors.blue,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.account_box),
                    label: Text('Outlineed Button with icon')),
                IconButton(
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      iconSize: 5550,
                      shadowColor: Colors.black,
                      elevation: 15,
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.add_call)),
                GestureDetector(
                  onTap: () {
                    print('Pressed');
                  },
                  onDoubleTap: () {
                    print('Double pressed');
                  },
                  onLongPress: () {
                    print('Long Pressed');
                  },
                  child: Image.asset(
                    'assets/img.png',
                    width: 100,
                  ),
                ),
                InkWell(
                    splashColor: Colors.purple,
                    onTap: () {
                      print('Pressed');
                    },
                    onDoubleTap: () {
                      print('Double pressed');
                    },
                    onLongPress: () {
                      print('Long Pressed');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Splashing',
                      ),
                    )),
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Card is added'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your name: ',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal, width: 3),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your ID: ',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email: ',
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your password: ',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      print(value);
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
