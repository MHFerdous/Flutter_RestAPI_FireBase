import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_application/firebase_notification_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await FirebaseNotificationHandler().initialization();

  runApp(
    const BasketBallLiveScoreApp(),
  );
}

class BasketBallLiveScoreApp extends StatelessWidget {
  const BasketBallLiveScoreApp({Key? key}) : super(key: key);

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
        title: const Text('BasketBall Live'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('basketball')
            .doc('2023_ban_vs_ind')
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          log(snapshot.data!.data().toString());

          if (snapshot.hasData) {
            final score = snapshot.data!;
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    score.get('match_name'),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            score.get('score_team_a').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_a'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                      const Text('vs'),
                      Column(
                        children: [
                          Text(
                            score.get('score_team_b').toString(),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            score.get('team_b'),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance
              .collection('basketball')
              .doc('2023_ban_vs_ind')
              .update({'match_name': "Bangladesh vs India"});
        },
        child: const Text('Update'),
      ),
    );
  }
}
