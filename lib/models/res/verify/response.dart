import 'package:fertilizer_pin/models/user/user.dart';

class VerifyResponse {
  User result;

  VerifyResponse({required this.result});

  factory VerifyResponse.formJson(Map<String, dynamic> json) {
    return VerifyResponse(result: resultParse(json['result']));
  }

  static User resultParse(body) {
    User user = new User.formJson(body);
    return user;
  }
}
