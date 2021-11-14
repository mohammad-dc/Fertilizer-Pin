import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditEmailController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editEmailFormKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  var email = '';

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
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

  void checkEditEmail() {
    final isValid = editEmailFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editEmailFormKey.currentState!.save();
    print(email);
  }
}
