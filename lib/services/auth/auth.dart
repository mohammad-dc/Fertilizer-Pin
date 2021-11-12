import 'dart:convert';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/error/error.dart';
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

    final response = await get('$BASE_URL/verify', headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });
    print(response.status.hasError);
    if (response.status.hasError) {
      return Error.formJson(jsonDecode(response.body));
    } else {
      return Verify.formJson(jsonDecode(response.body));
    }
  }

  static Future<dynamic> register(body) async {}

  static Future<dynamic> login(body) async {}
}
