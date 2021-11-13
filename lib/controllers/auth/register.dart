import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late TextEditingController emailController,
      passwordController,
      fullNameController,
      ssnNumberController,
      phoneController,
      addressController;

  var email = '';
  var password = '';
  var fullName = '';
  var snnNumber = '';
  var phone = '';
  var address = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    ssnNumberController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    ssnNumberController.dispose();
    phoneController.dispose();
    addressController.dispose();
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

  String? valideateFullName(String value) {
    if (value.length < 1) {
      return 'يجب ملئ الحقل';
    }
    return null;
  }

  String? valideateSSNNumber(String value) {
    if (value.length < 9) {
      return 'يجب ملئ الحقل بالشكل الصحيح';
    }
    return null;
  }

  String? valideatePhone(String value) {
    if (value.length < 10) {
      return 'يجب ملئ الحقل بالشكل الصحيح';
    }
    return null;
  }

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    print(email);
    print(password);
  }
}
