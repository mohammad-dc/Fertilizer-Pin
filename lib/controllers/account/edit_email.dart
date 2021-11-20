import 'package:flutter/cupertino.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:get/get.dart';

class EditEmailController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editEmailFormKey = GlobalKey<FormState>();

  var editError = Error(success: false, message: '').obs();
  var editSuccess = UpdateResponse(success: false, message: '').obs();

  late TextEditingController emailController;

  var email = '';

  RxBool loading = false.obs;

  var userServices = UserServices();
  var account = Get.find<AccountController>().account;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController(text: account.email);
  }

  @override
  void onClose() {
    emailController.dispose();
  }

  String? valideateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'يجب ادخال البريد الاكتروني بالشكل الصحيح';
    }
    return null;
  }

  void checkEditEmail() async {
    final isValid = editEmailFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);
    editEmailFormKey.currentState!.save();
    final response = await userServices.updateEmail(email, account.id);
    if (response != null) {
      if (response is Error) {
        loading(false);
        editError = response;
        update();
      } else if (response is UpdateResponse) {
        loading(false);
        editSuccess = response;
        account.email = email;
        update();
        Get.offNamed('/profile');
      }
    }
  }
}
