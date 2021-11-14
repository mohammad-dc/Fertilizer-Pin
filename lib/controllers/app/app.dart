import 'package:get/get.dart';

class AppController extends GetxController with StateMixin<dynamic> {
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
    onPageTapped(currentPage.value);
  }

  void onPageTapped(int page) {
    currentPage(page);
  }
}
