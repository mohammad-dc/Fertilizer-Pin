import 'dart:convert';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/posts/post.dart';
import 'package:get/get.dart';

class PostServeice extends GetConnect {
  Future<dynamic> getPosts(skip) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
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
      return Posts.formJson(jsonDecode(response.body));
    }
  }
}
