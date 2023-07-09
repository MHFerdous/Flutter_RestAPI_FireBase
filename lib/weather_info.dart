class WeatherInfo {
  final String time;
      /*dewPoint,
      humidity,
      temperature,
      temperatureApparent;*/


  WeatherInfo(this.time/*, this.temperature,  this.dewPoint,
      this.humidity, this.temperatureApparent*/);

  factory WeatherInfo.toJson(Map<String, dynamic> e) {
    return WeatherInfo(
      e['data']['time'],
      /*e['dewPoint'],
      e['humidity'],
      e['temperature'],
      e['temperatureApparent'],*/
    );
  }
}
