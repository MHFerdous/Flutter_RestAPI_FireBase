import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? time;
  String? temp;
  String? description = 'r';
  int? temp2;
  String? location;
  String? userLocation = 'Sylhet';
  String? humidity;
  int? maxTemp;
  int? minTemp;
  bool inProgress = false;

  descriptionModel() {
    if ((temp2 ?? 0) < -20) {
      description = 'Too much snowing';
      setState(() {});
    }
    if ((temp2 ?? 0) < -15 && (temp2 ?? 0) >= -10) {
      description = 'Snow';
      setState(() {});
    }
    if ((temp2 ?? 0) > -9 && (temp2 ?? 0) <= -5) {
      description = 'Too much cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > -4 && (temp2 ?? 0) <= 0) {
      description = 'Mostly Cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > 0 && (temp2 ?? 0) <= 5) {
      description = 'Cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > 6 && (temp2 ?? 0) <= 10) {
      description = 'Cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > 11 && (temp2 ?? 0) <= 15) {
      description = 'Weather is cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > 16 && (temp2 ?? 0) <= 20) {
      description = 'Sunny and Cool';
      setState(() {});
    }
    if ((temp2 ?? 0) > 21 && (temp2 ?? 0) <= 25) {
      description = 'Sunny';
      setState(() {});
    }
    if ((temp2 ?? 0) > 26 && (temp2 ?? 0) <= 30) {
      description = 'Mostly Sunny';
      setState(() {});
    }
    if ((temp2 ?? 0) > 31 && (temp2 ?? 0) < 35) {
      description = 'Hot';
      setState(() {});
    }
    if ((temp2 ?? 0) > 36 && (temp2 ?? 0) <= 40) {
      description = 'Mostly Hot';
      setState(() {});
    }
    if ((temp2 ?? 0) > 40) {
      description = 'Too much hot';
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
    descriptionModel();
  }

  void getWeather() async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse(
          'https://api.tomorrow.io/v4/weather/realtime?location=$userLocation&apikey=traXCJeobg5nWiW56S2LmwdPz2KR3JfW'),
    );

    final data = jsonDecode(response.body);
    temp = data['data']['values']['temperature'].toString();
    temp2 = data['data']['values']['temperature'].toInt();

    /// ami je api niyechi setay max temp nai. Tai ami temp er shate +10 kore diyechi, karon api te max temp data nai

    maxTemp = data['data']['values']['temperature'].toInt() + 10;

    /// ami je api niyechi setay min temp nai. Tai ami temp er shate -5 kore diyechi, karon api te min temp data nai

    minTemp = data['data']['values']['temperature'].toInt() - 5;
    humidity = data['data']['values']['humidity'].toString();
    location = data['location']['name'].toString();
    time = data['data']['time']
        .toString()
        .replaceAll(
          'T',
          '\n\nTime : ',
        )
        .replaceAll(':00Z', '  ');

    if (response.statusCode != 200) {
      const Text('Failed fetching data');
    }

    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade800,
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.settings),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          )
        ],
      ),
      body: inProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  ListTile(
                    title: Text(
                      location.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          time!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.sunny_snowing,
                            size: 35,
                            color: Colors.yellowAccent,
                          ),
                          title: Text(
                            temp.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                            ),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  'max : ${maxTemp.toString()}',
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      letterSpacing: 1),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'min : ${minTemp.toString()}',
                                  style: TextStyle(
                                      color: Colors.grey.shade100,
                                      letterSpacing: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Humidity : ${humidity.toString()}',
                          style: const TextStyle(
                              color: Colors.white,
                              letterSpacing: 0.8,
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Column(
                      children: [
                        Text(
                          description.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
