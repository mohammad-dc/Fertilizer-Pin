import 'package:fertilizer_pin/models/weather/condition.dart';
import 'package:fertilizer_pin/models/weather/weather.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/weather/weather.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController with StateMixin<dynamic> {
  var weatherSuccess =
      Weather(condition: WeatherCondition(icon: '', text: '')).obs();
  var weatherError = Error(success: false, message: '').obs();

  RxBool loading = false.obs;

  var weatherServices = WeatherServices();

  void getWeather() async {
    loading(true);
    final response = await weatherServices.getWeather();

    if (response != null) {
      if (response is Error) {
        weatherError = response;
        loading(false);
      } else if (response is Weather) {
        weatherSuccess = response;
        loading(false);
      }
    }
  }
}
