class Sensor {
  String sensorName;
  String value;

  Sensor({this.sensorName = '', this.value = ''});

  factory Sensor.formJson(Map<String, dynamic> json) {
    return Sensor(sensorName: json['sensor_name'], value: json['value']);
  }
}
