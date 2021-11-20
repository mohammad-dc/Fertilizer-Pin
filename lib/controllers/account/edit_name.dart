import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/update/update.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditFullNameController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editFullNameFormKey = GlobalKey<FormState>();

  var editError = Error(success: false, message: '').obs();
  var editSuccess = UpdateResponse(success: false, message: '').obs();

  late TextEditingController fullNameController;

  var fullName = '';

  RxBool loading = false.obs;

  var userServices = UserServices();
  var account = Get.find<AccountController>().account;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController(text: account.fullName);
  }

  @override
  void onClose() {
    fullNameController.dispose();
  }

  String? valideateFullName(String value) {
    if (value.length < 1) {
      return 'يجب ملئ الحقل';
    }
    return null;
  }

  void checkEditFullName() async {
    final isValid = editFullNameFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loading(true);

    editFullNameFormKey.currentState!.save();
    final response = await userServices.updateFullName(fullName, account.id);
    if (response != null) {
      if (response is Error) {
        loading(false);
        editError = response;
        update();
      } else if (response is UpdateResponse) {
        loading(false);
        editSuccess = response;
        account.fullName = fullName;
        update();
        Get.offNamed('/profile');
      }
    }
  }
}
