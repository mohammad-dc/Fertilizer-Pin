import 'dart:async';

import 'package:fertilizer_pin/models/res/login/login.dart';
import 'package:fertilizer_pin/models/res/login/response.dart';
import 'package:fertilizer_pin/models/res/register/register.dart';
import 'package:fertilizer_pin/models/res/verify/response.dart';
import 'package:fertilizer_pin/models/res/verify/verify.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  var verifySuccess =
      Verify(success: false, response: VerifyResponse(result: User())).obs();

  var loginSuccess =
      Login(success: false, response: LoginResponse(result: User())).obs();

  var registerSuccess = Register(success: false, message: '').obs();

  var authService = AuthServices();

  @override
  void onInit() {
    verify();
    super.onInit();
  }

  void verify() async {
    var response = await authService.verifyAccount();

    if (response != null) {
      if (response is Error) {
        print(response.message);
        Timer(Duration(seconds: 3), () => Get.toNamed('/login'));
      } else if (response is Verify) {
        verifySuccess = response;
        print(verifySuccess);
      }
    }
  }

  void login(body) async {
    var response = await authService.login(body);
    if (response != null) {
      if (response is Error) {
        print(response.message);
      } else if (response is Login) {
        loginSuccess = response;
      }
    }
  }

  void register(body) async {
    var response = await authService.register(body);
    if (response != null) {
      if (response is Error) {
        print(response.message);
      } else if (response is Register) {
        registerSuccess = response;
      }
    }
  }
}
