import 'package:fertilizer_pin/models/user/user.dart';

class LoginResponse {
  User result;

  LoginResponse({required this.result});

  factory LoginResponse.formJson(Map<String, dynamic> json) {
    return LoginResponse(result: resultParse(json['result']));
  }

  static User resultParse(body) {
    User user = new User.formJson(body);
    return user;
  }
}
