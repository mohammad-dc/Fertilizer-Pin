import 'package:fertilizer_pin/models/res/login/response.dart';

class Login {
  bool success;
  LoginResponse response;

  Login({this.success = false, required this.response});

  factory Login.formJson(Map<String, dynamic> json) {
    return Login(
        success: json['success'], response: responseParse(json['response']));
  }

  static LoginResponse responseParse(body) {
    LoginResponse loginResponse = new LoginResponse.formJson(body);
    return loginResponse;
  }
}
