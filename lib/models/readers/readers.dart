import 'package:fertilizer_pin/models/readers/sensor.dart';
import 'package:flutter/material.dart';

class Readers {
  String nodeName;
  String nopdeStatus;
  String lastRecieved;
  List<Sensor> sensors;

  Readers(
      {this.nodeName = '',
      this.lastRecieved = '',
      this.nopdeStatus = '',
      this.sensors = const []});

  factory Readers.formJson(Map<String, dynamic> json) {
    return Readers(
        nodeName: json['node_name'],
        nopdeStatus: json['node_status'],
        lastRecieved: json['last_recieved'],
        sensors: sensorsParse(json['sensors']));
  }

  static List<Sensor> sensorsParse(body) {
    var list = body as List;
    List<Sensor> sensors = list.map((e) => Sensor.formJson(e)).toList();
    return sensors;
  }
}
