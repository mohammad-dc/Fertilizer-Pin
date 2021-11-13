import 'package:fertilizer_pin/models/res/posts/response.dart';

class Posts {
  bool success;
  PostResponse response;

  Posts({this.success = false, required this.response});

  factory Posts.formJson(Map<String, dynamic> json) {
    return Posts(
        success: json['success'], response: responseParse(json['response']));
  }

  static PostResponse responseParse(body) {
    PostResponse postResponse = new PostResponse.formJson(body);
    return postResponse;
  }
}
