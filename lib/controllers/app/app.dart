import 'dart:io';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';

class AppController extends GetxController with StateMixin<dynamic> {
  RxInt currentPage = 0.obs;

  RxBool appInternetConnection = false.obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAppInternetConnection(false, false);
    onPageTapped(currentPage.value);
  }

  void onPageTapped(int page) {
    currentPage(page);
  }

  void checkAppInternetConnection(bool click, bool load) async {
    loading(load);
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      loading(false);
      var accountController = Get.put(AccountController());
      var cityController = Get.put(CityController());
      accountController.verify();
      cityController.getAllCities();
    } else {
      if (click) {
        checkAppInternetConnection(click, load);
      } else {
        loading(false);
        Get.offAllNamed("/noInternet");
      }
    }
  }
}
