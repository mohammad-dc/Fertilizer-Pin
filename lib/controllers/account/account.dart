import 'dart:async';
import 'dart:io';

import 'package:fertilizer_pin/config/storage.dart';
import 'package:fertilizer_pin/controllers/readers/readers.dart';
import 'package:fertilizer_pin/models/res/update/update_image.dart';
import 'package:fertilizer_pin/models/res/verify/response.dart';
import 'package:fertilizer_pin/models/res/verify/verify.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/services/auth/auth.dart';
import 'package:fertilizer_pin/services/user/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class AccountController extends GetxController with StateMixin<dynamic> {
  User account = User().obs();
  var verifySuccess =
      Verify(success: false, response: VerifyResponse(result: User())).obs();

  var editError = Error(success: false, message: '').obs();
  var editSuccess =
      UpdateImageResponse(success: false, message: '', image: '').obs();

  var authService = AuthServices();
  var userServices = UserServices();
  var readersController = Get.find<ReaderController>();

  var picker = ImagePicker();

  RxBool updateImageLoading = false.obs;

  RxBool loading = false.obs;

  void verify() async {
    loading(true);
    var response = await authService.verifyAccount();
    if (response != null) {
      if (response is Error) {
        loading(false);
        Timer(Duration(seconds: 3), () => Get.offNamed('/login'));
      } else if (response is Verify) {
        verifySuccess = response;
        account = response.response.result;
        readersController.getPinData(account.deviceId.toString());
        loading(false);
        Get.offNamed('/home');
      }
    }
  }

  void logout() async {
    if (await SharedPreferencesHelper.checkIfExsist('token')) {
      await SharedPreferencesHelper.removeFromStorage('token');
      Get.offAllNamed('/login');
      update();
    }
  }

  void changeImageProfile() async {
    updateImageLoading(true);
    final pickImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickImage != null) {
      final response = await userServices.updateProfileImage(
          File(pickImage.path), account.id);

      if (response != null) {
        if (response is Error) {
          editError = response;
          updateImageLoading(false);
        } else if (response is UpdateImageResponse) {
          editSuccess = response;
          account.image = response.image;
          update();
          updateImageLoading(false);
        }
      }
    }
  }
}
