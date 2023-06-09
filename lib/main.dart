import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _IDEditingController =
      TextEditingController(text: '30003');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basic Widgets'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Enter your name: '),
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
                    controller: _IDEditingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Enter your ID: '),
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
                      label: Text('Enter your email: '),
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextField(
                    controller: _passwordTextEditingController,
                    decoration: InputDecoration(
                        label: Text(
                          'Password: ',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'Enter your password: ',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        )),
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
                ElevatedButton(
                  onPressed: () {
                    print(_IDEditingController.text);
                    print(_passwordTextEditingController.text);
                    _passwordTextEditingController.text = 'hgh';
                    _passwordTextEditingController.clear();
                  },
                  child: Text('Done'),
                )
              ],
            ),
          ),
        ));
  }
}
