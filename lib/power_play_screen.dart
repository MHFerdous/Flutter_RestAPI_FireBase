import 'package:flutter/material.dart';
import 'package:mobile_application/player_screen.dart';

class PowerPlayScreen extends StatefulWidget {
  const PowerPlayScreen({super.key});

  @override
  State<PowerPlayScreen> createState() => _PowerPlayScreenState();
}

class _PowerPlayScreenState extends State<PowerPlayScreen> {
  Color _borderColor = Colors.white24;
  int? tappedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        leading: Padding(
          padding:
              const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 4),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey.shade900),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          'Start Power Play Overs',
          style: TextStyle(fontWeight: FontWeight.w400, letterSpacing: 0.3),
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, left: 8),
                child: Text(
                  'Power Play 1',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 0.3),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.count(
            crossAxisCount: 8,
            shrinkWrap: true,
            children: List.generate(
              20,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      tappedIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      height: 4,
                      width: 100,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: tappedIndex != null
                                  ? Colors.yellow
                                  : Colors.white70)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16, left: 8),
                child: Text(
                  'Power Play 1',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: 0.3),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          GridView.count(
            crossAxisCount: 8,
            shrinkWrap: true,
            children: List.generate(
              20,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 4,
                      width: 100,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 26,
          ),
          Text(
            '*Batting power play over can be selected lated during scoring from the settings',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlayerScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600),
                child: const Text(
                  'Done',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
