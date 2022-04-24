import 'dart:async';
import 'dart:io';

import 'package:fertilizer_pin/config/config.dart';
import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/city/city.dart';
import 'package:fertilizer_pin/controllers/weather/weather.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:get/get.dart';

class AppController extends GetxController with StateMixin<dynamic> {
  RxInt currentPage = 0.obs;

  RxBool appInternetConnection = false.obs;

  late StreamSubscription<InternetConnectionStatus> _listener;

  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkAppInternetConnection();
    onPageTapped(currentPage.value);
  }

  @override
  void onClose() {
    _listener.cancel();
  }

  void onPageTapped(int page) {
    currentPage(page);
  }

  void checkAppInternetConnection() {
    _listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          appInternetConnection.value = true;
          var accountController = Get.put(AccountController());
          var cityController = Get.put(CityController());
          var weatherController = Get.put(WeatherController());
          accountController.verify();
          cityController.getAllCities();
          weatherController.getWeather();
          break;
        case InternetConnectionStatus.disconnected:
          appInternetConnection.value = false;
          Get.offAllNamed("/noInternet");
          break;
      }
    });
  }
}
