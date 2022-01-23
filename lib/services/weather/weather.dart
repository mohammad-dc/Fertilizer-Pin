import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/weather/weather.dart';
import 'package:get/get.dart';

class WeatherServices extends GetConnect {
  Future<dynamic> getWeather() async {
    final response = await get(
        "https://api.weatherapi.com/v1/current.json?key=$WEATHER_KEY&q=Palestine&aqi=no");

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return Weather.formJson(response.body['current']);
    }
  }
}
