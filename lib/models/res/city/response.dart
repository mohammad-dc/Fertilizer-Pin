import 'package:fertilizer_pin/models/city/city.dart';

class CitiesResponse {
  List<City> results;

  CitiesResponse({required this.results});

  factory CitiesResponse.formJson(Map<String, dynamic> json) {
    return CitiesResponse(results: resultParse(json['results']));
  }

  static List<City> resultParse(body) {
    var list = body as List;
    List<City> cities = list.map((e) => City.formJson(e)).toList();
    return cities;
  }
}
