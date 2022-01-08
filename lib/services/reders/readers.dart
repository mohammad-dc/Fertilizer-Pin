import 'dart:convert';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/readers/login.dart';
import 'package:fertilizer_pin/models/readers/readers.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:get/get.dart';

class ReadersServices extends GetConnect {
  Future<dynamic> login(body) async {
    final response = await post('$PIN_BASE_URL/login/', <String, String>{
      'username': body['username'],
      'password': body['password']
    });
    if (response.status.hasError) {
      return Error.formJson(jsonDecode(
          jsonEncode({'success': false, 'message': 'error from pin login'})));
    } else {
      SharedPreferencesHelper.signToStorage(
          'pin_token', response.body['token']);
      return ReadersLogin.formJson(response.body);
    }
  }

  Future<dynamic> verify(deviceId) async {
    String? pinToken = "";

    if (await SharedPreferencesHelper.checkIfExsist('pin_token')) {
      pinToken = (await SharedPreferencesHelper.getStorageData('pin_token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await get('$PIN_BASE_URL/dashboard/?device_id=$deviceId',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Token $pinToken'
        });

    if (response.status.hasError) {
      if (!response.body['detail'].isEmpty) {
        return Error.formJson(jsonDecode(
            jsonEncode({'success': false, 'message': 'token wrong'})));
      } else {
        return Error.formJson(jsonDecode(jsonEncode(
            {'success': false, 'message': 'error from pin verify'})));
      }
    } else {
      return Readers.formJson(response.body['data']['01']);
    }
  }
}
