import 'package:fertilizer_pin/models/city/city.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/city/city.dart';
import 'package:fertilizer_pin/models/res/city/response.dart';
import 'package:fertilizer_pin/services/city/city.dart';
import 'package:get/get.dart';

class CityController extends GetxController with StateMixin<dynamic> {
  Cities citySuccess =
      Cities(response: CitiesResponse(results: List<City>.empty())).obs();
  var cityError = Error(success: false, message: '').obs();

  var citiesService = CitiesService();

  void getAllCities() async {
    final response = await citiesService.getAllCities();

    if (response != null) {
      if (response is Error) {
        cityError = response;
      } else if (response is Cities) {
        citySuccess = response;
      }
    }
  }
}
