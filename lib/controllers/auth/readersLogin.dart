import 'package:fertilizer_pin/controllers/readers/readers.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/readers/login.dart';
import 'package:fertilizer_pin/services/reders/readers.dart';
import 'package:get/get.dart';

class ReadersLoginController extends GetxController with StateMixin<dynamic> {
  var readersLogin = ReadersLogin().obs();
  var readersLoginError = Error(success: false, message: '').obs();

  RxBool loading = false.obs;

  var readersServices = ReadersServices();

  var readerController = Get.find<ReaderController>();

  void pinLogin(body) async {
    loading(true);
    final response = await readersServices.login(body);

    if (response != null) {
      if (response is Error) {
        readersLoginError = response;
        loading(false);
      } else if (response is ReadersLogin) {
        readersLogin = response;
        readerController.getPinData(body['devide_id'].toString());
        loading(false);
      }
    }
  }
}
