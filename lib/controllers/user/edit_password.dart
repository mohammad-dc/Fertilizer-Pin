import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditPasswordController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editPasswordFormKey = GlobalKey<FormState>();

  late TextEditingController passwordController,
      newPasswordController,
      confirmPassowrdController;

  var password = '';
  var newPassword = '';
  var confirmPassword = '';

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmPassowrdController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPassowrdController.dispose();
  }

  String? valideatePassword(String value) {
    if (value.length < 5) {
      return 'كلمة المرور يجب ان تحتوي على الاقل 6 مدخلات';
    }
    return null;
  }

  String? valideateNewPassword(String value) {
    if (value.length < 5) {
      return 'كلمة المرور يجب ان تحتوي على الاقل 6 مدخلات';
    }
    return null;
  }

  String? valideateConfirmPassword(String value) {
    if (value != newPassword) {
      return 'كلمة المرور غير متطابقة مع كلمة المرور الجديدة';
    }
    return null;
  }

  void checkEditPassowrd() {
    final isValid = editPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editPasswordFormKey.currentState!.save();
    print(password);
    print(newPassword);
    print(confirmPassword);
  }
}
