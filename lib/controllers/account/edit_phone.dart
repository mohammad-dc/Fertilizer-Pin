import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditPhoneController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editPhoneFormKey = GlobalKey<FormState>();

  var editError = Error(success: false, message: '').obs();
  var editSuccess = UpdateResponse(success: false, message: '').obs();

  late TextEditingController phoneController;

  var phone = '';

  RxBool loading = false.obs;

  var userServices = UserServices();
  var account = Get.find<AccountController>().account;

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController(text: account.phone);
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

  void checkEditPhone() async {
    final isValid = editPhoneFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);
    editPhoneFormKey.currentState!.save();
    final response = await userServices.updatePhone(phone, account.id);
    if (response != null) {
      if (response is Error) {
        loading(false);
        editError = response;
        update();
      } else if (response is UpdateResponse) {
        loading(false);
        editSuccess = response;
        account.phone = phone;
        update();
        Get.back();
      }
    }
  }
}
