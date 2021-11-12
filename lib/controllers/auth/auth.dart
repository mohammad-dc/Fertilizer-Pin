import 'dart:async';

import 'package:fertilizer_pin/models/res/verify/response.dart';
import 'package:fertilizer_pin/models/res/verify/verify.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  var verifySuccess =
      Verify(success: false, response: VerifyResponse(result: User())).obs();

  @override
  void onInit() {
    verify();
    super.onInit();
  }

  void verify() async {
    print('object');
    var authService = AuthServices();
    var response = await authService.verifyAccount();

    if (response != null) {
      if (response is Error) {
        print('error');
        print(response.message);
        Timer(Duration(seconds: 3), () => Get.toNamed('/login'));
      } else if (response is Verify) {
        print('success');
        verifySuccess = response;
        print(verifySuccess);
      }
    }
  }
}
