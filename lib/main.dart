import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getDataFromFirebase() async {
    CollectionReference basketBallRef =
        firebaseFirestore.collection('basketball');
    final DocumentReference documentReference =
        basketBallRef.doc('2023_ban_vs_ind');
    final data = await documentReference.get();
    print(data.data());
  }

  @override
  void initState() {
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBall Live'),
      ),
      body: FutureBuilder(
        future: firebaseFirestore
            .collection('basketball')
            .doc('2023_ban_vs_ind')
            .get(),
        builder: (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
          print(snapshot.data?.data());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
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
              return const SizedBox();
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
