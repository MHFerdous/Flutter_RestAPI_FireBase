class WeatherInfo {
  final String time, minTemperature, maxTemperature, description;

  WeatherInfo(
      this.time, this.minTemperature, this.maxTemperature, this.description);

  factory WeatherInfo.toJson(Map<String, dynamic> e) {
    return WeatherInfo(
      e['temp'],
      e['temp_min'],
      e['temp_max'],
      e['description'],
    );
  }
}
