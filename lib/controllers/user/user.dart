import 'package:fertilizer_pin/models/user/user.dart';
import 'package:get/get.dart';

class AccountController extends GetxController with StateMixin<dynamic> {
  var account = User().obs();
}
