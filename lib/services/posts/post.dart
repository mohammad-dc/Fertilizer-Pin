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

    final response = await get('$BASE_URL/posts/get/$skip',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        });

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return Posts.formJson(response.body);
    }
  }
}
