import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditPhoneController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editPhoneFormKey = GlobalKey<FormState>();

  late TextEditingController phoneController;

  var phone = '';

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    phoneController.dispose();
  }

  String? valideatePhone(String value) {
    if (value.length < 10) {
      return 'يجب ملئ الحقل بالشكل الصحيح';
    }
    return null;
  }

  void checkEditPhone() {
    final isValid = editPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editPhoneFormKey.currentState!.save();
    print(phone);
  }
}
