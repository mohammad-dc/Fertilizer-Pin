import 'dart:async';

import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/models/res/verify/response.dart';
import 'package:fertilizer_pin/models/res/verify/verify.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:get/get.dart';

class AccountController extends GetxController with StateMixin<dynamic> {
  User account = User().obs();
  var verifySuccess =
      Verify(success: false, response: VerifyResponse(result: User())).obs();

  var authService = AuthServices();

  @override
  void onInit() {
    super.onInit();
    verify();
  }

  void verify() async {
    var response = await authService.verifyAccount();
    if (response != null) {
      if (response is Error) {
        Timer(Duration(seconds: 3), () => Get.offNamed('/login'));
      } else if (response is Verify) {
        verifySuccess = response;
        account = verifySuccess.response.result;
        Get.offNamed('/home');
        update();
      }
    }
  }

  void logout() async {
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      await SharedPreferencesHelper.removeFromStorage('token');
      Get.offAllNamed('/');
      update();
    }
  }
}
