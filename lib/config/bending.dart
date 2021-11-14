import 'package:fertilizer_pin/controllers/auth/auth.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(CityController());
  }
}
