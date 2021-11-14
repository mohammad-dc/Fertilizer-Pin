import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/models/res/city/city.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:get/get.dart';

class CitiesService extends GetConnect {
  Future<dynamic> getAllCities() async {
    final response = await get('$BASE_URL/city/get');

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return Cities.formJson(response.body);
    }
  }
}
