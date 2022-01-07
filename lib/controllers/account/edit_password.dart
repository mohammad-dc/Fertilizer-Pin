import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';

class EditPasswordController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editPasswordFormKey = GlobalKey<FormState>();

  var editError = Error(success: false, message: '').obs();
  var editSuccess = UpdateResponse(success: false, message: '').obs();

  late TextEditingController passwordController,
      newPasswordController,
      confirmPassowrdController;

  var password = '';
  var newPassword = '';
  var confirmPassword = '';

  RxBool loading = false.obs;

  var userServices = UserServices();
  var account = Get.find<AccountController>().account;

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
    if (value != account.password) {
      return 'كلمة المرور ليست صحيحة';
    }
    return null;
  }

  String? valideateNewPassword(String value) {
    if (value.length < 5) {
      return 'كلمة المرور يجب ان تحتوي على الاقل 5 مدخلات';
    }
    return null;
  }

  String? valideateConfirmPassword(String value) {
    if (value != newPasswordController.text) {
      return 'كلمة المرور غير متطابقة مع كلمة المرور الجديدة';
    }
    return null;
  }

  void checkEditPassowrd() async {
    final isValid = editPasswordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editPasswordFormKey.currentState!.save();
    loading(true);

    editPasswordFormKey.currentState!.save();
    final response = await userServices.updatePassword(newPassword, account.id);
    if (response != null) {
      if (response is Error) {
        loading(false);
        editError = response;
        update();
      } else if (response is UpdateResponse) {
        loading(false);
        editSuccess = response;
        account.password = newPassword;
        update();
        Get.back();
      }
    }
  }
}
