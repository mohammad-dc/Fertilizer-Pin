class WeatherCondition {
  String text;
  String icon;

  WeatherCondition({this.text = '', this.icon = ''});
  factory WeatherCondition.formJson(Map<String, dynamic> json) {
    return WeatherCondition(text: json['text'], icon: json['icon']);
  }
}
