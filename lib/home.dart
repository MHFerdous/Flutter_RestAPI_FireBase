import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MY Bag'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/R.0e1b8d7164e70210853eb639398272d0?rik=SCPYuamufkGxKQ&riu=http%3a%2f%2fpixel.nymag.com%2fimgs%2fdaily%2fstrategist%2f2019%2f06%2f19%2fsunglasses-16.jpg&ehk=Q5umfOAxGOk%2bBvMHat51u8xvz49isFjcjyC9KvsprAE%3d&risl=&pid=ImgRaw&r=0'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                title: Text('asfgsd'),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text('Color: '),
                        Text(
                          'Black',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(' Size: '),
                        Text(
                          'L',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(onPressed: () {}, child: Icon(Icons.add))
                      ],
                    )
                  ],
                ),
                trailing: Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}
