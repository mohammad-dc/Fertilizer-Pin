import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/auth/readersLogin.dart';
import 'package:fertilizer_pin/models/readers/login.dart';
import 'package:fertilizer_pin/models/res/login/login.dart';
import 'package:fertilizer_pin/models/res/login/response.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:fertilizer_pin/services/reders/readers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var loginSuccess =
      Login(success: false, response: LoginResponse(result: User())).obs();
  var loginError = Error(success: false, message: '').obs();

  RxBool loading = false.obs;

  var authService = AuthServices();

  var account = Get.find<AccountController>();
  var readersLoginController = Get.put(ReadersLoginController());

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? valideateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'يجب ادخال البريد الاكتروني بالشكل الصحيح';
    }
    return null;
  }

  String? valideatePassword(String value) {
    if (value.length < 5) {
      return 'كلمة المرور يجب ان تحتوي على الاقل 5 مدخلات';
    }
    return null;
  }

  void checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);
    loginFormKey.currentState!.save();

    Map<String, dynamic> body = {'email': email, 'password': password};

    var response = await authService.login(body);
    if (response != null) {
      if (response is Error) {
        loading(false);
        loginError = response;
      } else if (response is Login) {
        loading(false);
        loginSuccess = response;
        account.account = response.response.result;
        Map<String, dynamic> bodyLoginPin = {
          'username': account.account.deviceUsername,
          'password': account.account.devicePassword,
          'devide_id': account.account.deviceId
        };
        account.verify();
        readersLoginController.pinLogin(bodyLoginPin);
        Get.offNamed('/home');
      }
    }
  }
}
