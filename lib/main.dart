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
    CollectionReference basketBallRef = firebaseFirestore.collection('basketball');
    final DocumentReference documentReference = basketBallRef.doc('2023_ban_vs_ind');
    final data = await documentReference.get();
    print(data.data());

  }
  @override
  void initState(){
    getDataFromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasketBall Live'),
      ),
      body: Center(
        child: Column(

          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Match Name',
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
                      '12',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Team name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                const Text('vs'),
                Column(
                  children: [
                    Text(
                      '12',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Team name',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
