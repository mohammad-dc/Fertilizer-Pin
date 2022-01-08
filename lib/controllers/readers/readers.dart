import 'package:fertilizer_pin/controllers/account/account.dart';
import 'package:fertilizer_pin/controllers/auth/readersLogin.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/readers/readers.dart';
import 'package:fertilizer_pin/models/user/user.dart';
import 'package:fertilizer_pin/services/reders/readers.dart';
import 'package:get/get.dart';

class ReaderController extends GetxController with StateMixin<dynamic> {
  var readers = Readers().obs();

  var readersError = Error(success: false, message: '').obs();

  RxBool loading = false.obs;

  var readersServices = ReadersServices();

  void getPinData(deviceID) async {
    loading(true);
    final response = await readersServices.verify(deviceID);

    if (response != null) {
      if (response is Error) {
        readersError = response;
        loading(false);
      } else if (response is Readers) {
        readers = response;
        loading(false);
      }
    }
  }
}
