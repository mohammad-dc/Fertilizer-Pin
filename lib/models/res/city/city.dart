import 'package:fertilizer_pin/models/res/city/response.dart';

class Cities {
  bool success;
  CitiesResponse response;

  Cities({this.success = false, required this.response});

  factory Cities.formJson(Map<String, dynamic> json) {
    return Cities(
        success: json['success'], response: responseParse(json['response']));
  }

  static CitiesResponse responseParse(body) {
    CitiesResponse citiesResponse = new CitiesResponse.formJson(body);
    return citiesResponse;
  }
}
