import 'package:fertilizer_pin/models/weather/condition.dart';

class Weather {
  double tempC;
  double tempF;
  WeatherCondition condition;

  Weather({this.tempC = 0.0, this.tempF = 0.0, required this.condition});

  factory Weather.formJson(Map<String, dynamic> json) {
    return Weather(
        tempC: json['temp_c'],
        tempF: json['temp_f'],
        condition: resultParse(json['condition']));
  }

  static WeatherCondition resultParse(body) {
    WeatherCondition weatherCondition = new WeatherCondition.formJson(body);
    return weatherCondition;
  }
}
