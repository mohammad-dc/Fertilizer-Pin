import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/app/app.dart';
import 'package:fertilizer_pin/controllers/auth/readersLogin.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:fertilizer_pin/controllers/readers/readers.dart';
import 'package:fertilizer_pin/controllers/weather/weather.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(ReaderController());
    Get.put(ReadersLoginController());
    Get.put(AppController());
    Get.put(AccountController());
    Get.put(CityController());
    Get.put(WeatherController());
  }
}
