import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditFullNameController extends GetxController with StateMixin<dynamic> {
  final GlobalKey<FormState> editFullNameFormKey = GlobalKey<FormState>();

  late TextEditingController fullNameController;

  var fullName = '';

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fullNameController = TextEditingController();
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

  void checkEditName() {
    final isValid = editFullNameFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    editFullNameFormKey.currentState!.save();
    print(fullName);
  }
}
