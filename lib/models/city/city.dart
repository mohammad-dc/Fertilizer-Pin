class City {
  int id;
  String city;

  City({this.id = 0, this.city = ""});

  factory City.formJson(Map<String, dynamic> json) {
    return City(id: json['id'], city: json['city']);
  }
}
