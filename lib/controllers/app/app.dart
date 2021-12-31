import 'dart:io';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:get/get.dart';

class AppController extends GetxController with StateMixin<dynamic> {
  RxInt currentPage = 0.obs;

  var accountController = Get.put(AccountController());
  var cityController = Get.put(CityController());

  @override
  void onInit() {
    super.onInit();
    checkInternetConnection();
    onPageTapped(currentPage.value);
  }

  void onPageTapped(int page) {
    currentPage(page);
  }

  void checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup(URI);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        accountController.verify();
        cityController.getAllCities();
      }
    } on SocketException catch (_) {
      Get.offAllNamed("/noInternet");
    }
  }
}
