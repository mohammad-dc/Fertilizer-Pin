import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/app/app.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(AccountController());
    Get.put(CityController());
  }
}
