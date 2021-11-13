import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;

  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    print('object');
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
      return 'كلمة المرور يجب ان تحتوي على الاقل 6 مدخلات';
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    print(email);
    print(password);
  }
}
