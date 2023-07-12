import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
//import 'package:practise_project/weather_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? time;
  String? temp;
  String? temp3;
  String? description = 'Mostly Sunny';
  double? temp2;
  double? temp4;
  String? location;
  String? userLocation = 'Russia';
  String? humidity;
  int? maxTemp;
  int? minTemp;
  bool inProgress = false;
  Icon? icons;
  Text? text;

  descriptionModel() {
    if ((temp4?.toDouble() ?? 0) <= -20.toDouble()) {
      iconsModel();
      return description = 'Too much snowing';
    } else if ((temp4?.toDouble() ?? 0) <= -15.toDouble()) {
      iconsModel();
      return description = 'Snow';
    } else if ((temp4?.toDouble() ?? 0) <= -10.toDouble()) {
      iconsModel();
      return description = 'Too much cool';
    } else if ((temp4?.toDouble() ?? 0) <= -5.toDouble()) {
      iconsModel();
      return description = 'Mostly Cool';
    } else if ((temp4?.toDouble() ?? 0) <= 0.toDouble()) {
      iconsModel();
      return description = 'Cool';
    } else if ((temp4?.toDouble() ?? 0) <= 5.toDouble()) {
      iconsModel();
      return description = 'Rain';
    } else if ((temp4?.toDouble() ?? 0) <= 10.toDouble()) {
      iconsModel();
      return description = 'Weather is cool';
    } else if ((temp4?.toDouble() ?? 0) <= 15.toDouble()) {
      iconsModel();
      return description = 'Sunny and Cool';
    } else if ((temp4?.toDouble() ?? 0) <= 20.toDouble()) {
      iconsModel();
      return description = 'Sunny';
    } else if ((temp4?.toDouble() ?? 0) <= 25.toDouble()) {
      iconsModel();
      return description = 'Mostly Sunny';
    } else if ((temp4?.toDouble() ?? 0) <= 30.toDouble()) {
      iconsModel();
      return description = 'Hot';
    } else if ((temp4?.toDouble() ?? 0) <= 35.toDouble()) {
      iconsModel();
      return description = 'Mostly Hot';
    } else if ((temp4?.toDouble() ?? 0) <= 40.toDouble()) {
      iconsModel();
      return description = 'Too much hot';
    }
  }

  iconsModel() {
    if ((temp4?.toDouble() ?? 0) <= -20.toDouble()) {
      return icons = const Icon(
        Icons.snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= -15.toDouble()) {
      return icons = const Icon(
        Icons.snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= -10.toDouble()) {
      return icons = const Icon(
        Icons.sunny_snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= -5.toDouble()) {
      return icons = const Icon(
        Icons.snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 0.toDouble()) {
      return icons = const Icon(
        Icons.water_drop_outlined,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 5.toDouble()) {
      return icons = const Icon(
        Icons.wb_cloudy_outlined,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 10.toDouble()) {
      return icons = const Icon(
        Icons.wb_sunny,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 15.toDouble()) {
      return icons = const Icon(
        Icons.wb_sunny_outlined,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 20.toDouble()) {
      return icons = const Icon(
        Icons.sunny,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 25.toDouble()) {
      return icons = const Icon(
        Icons.cloudy_snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 30.toDouble()) {
      return icons = const Icon(
        Icons.sunny_snowing,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 35.toDouble()) {
      return icons = const Icon(
        Icons.sunny,
        size: 30,
        color: Colors.yellowAccent,
      );
    } else if ((temp4?.toDouble() ?? 0) <= 40.toDouble()) {
      return icons = const Icon(
        Icons.sunny,
        size: 30,
        color: Colors.yellowAccent,
      );
    }
  }

  void getWeather() async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse(
          'https://api.tomorrow.io/v4/weather/realtime?location=$userLocation&apikey=traXCJeobg5nWiW56S2LmwdPz2KR3JfW'),
    );
    print(response.statusCode);
    print(response.body);
    final data = jsonDecode(response.body);
    temp = data['data']['values']['temperature'].toString();
    temp3 = data['data']['values']['temperature'].toString();
    temp2 = double.parse(temp3!).toDouble();
    temp4 = temp2;
    print('t $temp4');

    /// ami jei api nisi oitar modde, max temp nai. Tai ami temp er shate +10 kore diyesi, karon api te max temp data nei

    maxTemp = data['data']['values']['temperature'].toInt() + 10;

    /// ami jei api nisi oitar modde, min temp nai. Tai ami temp er shate -5 kore diyesi, karon api te min temp data nei

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

    if(response.statusCode != 200){
      text = const Text('Failed to load data or check your network connection');
    }

    inProgress = false;
    setState(() {
      descriptionModel();
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
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
      ) : text!=null ? Text(text.toString())
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
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Column(
                children: [
                  ListTile(
                    leading: icons,
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
                          SizedBox(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Humidity : ${humidity.toString()}',
                    style: TextStyle(
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
                    style: TextStyle(
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