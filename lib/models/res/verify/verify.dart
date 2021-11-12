import 'package:fertilizer_pin/models/res/verify/response.dart';

class Verify {
  bool success;
  VerifyResponse response;

  Verify({this.success = false, required this.response});

  factory Verify.formJson(Map<String, dynamic> json) {
    return Verify(
        success: json['success'], response: responseParse(json['response']));
  }

  static VerifyResponse responseParse(body) {
    VerifyResponse verifyResponse = new VerifyResponse.formJson(body);
    return verifyResponse;
  }
}
