import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_application/weather_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WeatherInfo> weatherInformation = [];

  bool inProgress = false;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  void getWeather() async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse(
          'https://api.tomorrow.io/v4/weather/realtime?location=toronto&apikey=traXCJeobg5nWiW56S2LmwdPz2KR3JfW'),
    );
    print(response.statusCode);
    print(response.body);
    final Map<String, dynamic> decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (var e in decodedResponse['data']) {
        weatherInformation.add(
          WeatherInfo.toJson(e),
        );
      }
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            ListTile(
              title: Text(
                'Current Location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                'Updated: ${weatherInformation}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: ListTile(
                leading: Image.network(
                  'fhoshfsudfhskdf',
                  width: 50,
                  height: 50,
                  errorBuilder: (_, __, ___) {
                    return Icon(
                      Icons.cloud_download,
                      size: 32,
                    );
                  },
                ),
                title: Text(
                  '69',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'max',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                        ),
                      ),
                      Text(
                        'min',
                        style: TextStyle(
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text(
                'Hasan Thundu',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
