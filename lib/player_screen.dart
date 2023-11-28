import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240.0,
            backgroundColor: Colors.blueGrey.shade800,
            floating: true,
            pinned: true,
            leading: Padding(
              padding:
                  const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 4),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey.shade900),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text('Moeen Ali'),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey.shade900),
                  child: const Icon(
                    Icons.edit,
                    size: 20,
                  ),
                ),
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.only(top: 140),
              title: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://th.bing.com/th/id/OIP.boL7dtr-aNrw-_oH6YJw-gHaER?rs=1&pid=ImgDetMain'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://th.bing.com/th/id/R.dfd482fb6cfc6405c555ebbb22232594?rik=mqAndhbj91Lxxg&pid=ImgRaw&r=0'),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 230,
                    top: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              fontSize: 8, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Column(
                      children: [
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Moeen Ali',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'England',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '24K',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '220K',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 275,
                              height: 70,
                              color: Colors.blueGrey.shade900,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Analyse Your Game Performances',
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.green.shade900),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 45, right: 8, top: 2),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.yellow,
                                      ),
                                      child: const Text(
                                        'Insights',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                            /*Container(

                              child: Text(
                                'Analyse Your Game Performances',
                                style: TextStyle(color: Colors.green.shade900),
                              ),
                            ),*/
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(title: Text('Item #$index')),
              childCount: 1000,
            ),
          ),*/
        ],
      ),
    );
  }
}
