import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';
import 'package:fertilizer_pin/models/res/update/update_image.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;

class UserServices extends GetConnect {
  Future<dynamic> updateFullName(fullName, id) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await put('$BASE_URL/user/full_name/update/$id',
        <String, String>{'full_name': fullName});

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return UpdateResponse.formJson(response.body);
    }
  }

  Future<dynamic> updateEmail(email, id) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await put(
        '$BASE_URL/user/email/update/$id', <String, String>{'email': email});

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      SharedPreferencesHelper.signToStorage('token', response.body['token']);
      return UpdateResponse.formJson(response.body);
    }
  }

  Future<dynamic> updatePhone(phone, id) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await put(
        '$BASE_URL/user/phone/update/$id', <String, String>{'phone': phone});

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return UpdateResponse.formJson(response.body);
    }
  }

  Future<dynamic> updatePassword(newPassword, id) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await put('$BASE_URL/user/password/update/$id',
        <String, String>{'new_password': newPassword});

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return UpdateResponse.formJson(response.body);
    }
  }

  Future<dynamic> updateLocation(address, city, id) async {
    String? token = "";
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    final response = await put('$BASE_URL/user/location/update/$id',
        <String, dynamic>{'city': city, 'address': address});

    if (response.status.hasError) {
      return Error.formJson(response.body);
    } else {
      return UpdateResponse.formJson(response.body);
    }
  }

  Future<dynamic> updateProfileImage(image, id) async {
    String? token = "";
    FormData? formData;
    var _image;
    String filename = image.path.split('/').last;
    _image = await MultipartFile.fromFile(image.path, filename: filename);
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      token = (await SharedPreferencesHelper.getStorageData('token'));
    } else {
      return Error.formJson(
          jsonDecode(jsonEncode({'success': false, 'message': 'no token'})));
    }

    formData = FormData.fromMap(<String, dynamic>{"image": _image});

    Dio dio = Dio();
    try {
      Response response = await dio.put('$BASE_URL/user/image/update/$id',
          data: formData,
          options: Options(
            followRedirects: false,
            validateStatus: (status) => true,
            headers: <String, String>{'Authorization': 'Bearer $token'},
          ));

      if (response.statusCode == 202) {
        print(response.data);
        return UpdateImageResponse.formJson(response.data);
      } else if (response.statusCode == 401 ||
          response.statusCode == 500 ||
          response.statusCode == 400) {
        print(response.data);
        return Error.formJson(response.data);
      } else {
        return Exception('حدث خطأ في العملية : ${response.toString()}');
      }
    } catch (e) {
      print(e);
    }
  }
}
