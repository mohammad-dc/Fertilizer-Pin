import 'dart:convert';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/login/login.dart';
import 'package:fertilizer_pin/models/res/register/register.dart';
import 'package:fertilizer_pin/models/res/verify/verify.dart';
import 'package:get/get.dart';

class AuthServices extends GetConnect {
  Future<dynamic> verifyAccount() async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = await SharedPreferencesHelper.getStorageData('token');
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await get('$BASE_URL/auth/verify',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.status.hasError) {
      return Error.formJson(jsonDecode(response.body));
    } else {
      return Verify.formJson(jsonDecode(response.body));
    }
  }

  Future<dynamic> register(body) async {
    final response = await post('$BASE_URL/auth/signup', <String, String>{
      'full_name': body['full_name'],
      'email': body['email'],
      'password': body['password'],
      'ssn_number': body['ssn_number'],
      'phone': body['phone'],
      'city': body['city'],
      'address': body['address']
    });
    if (response.status.hasError) {
      return Error.formJson(jsonDecode(response.body));
    } else {
      return Register.formJson(jsonDecode(response.body));
    }
  }

  Future<dynamic> login(body) async {
    final response = await post('$BASE_URL/auth/login',
        <String, String>{'email': body['email'], 'password': body['password']});
    if (response.status.hasError) {
      return Error.formJson(jsonDecode(response.body));
    } else {
      SharedPreferencesHelper.signToStorage(
          'token', jsonDecode(response.body)['response']['token'].toString());
      return Login.formJson(jsonDecode(response.body));
    }
  }
}
