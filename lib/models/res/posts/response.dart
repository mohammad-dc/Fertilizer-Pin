import 'package:fertilizer_pin/models/post/post.dart';
import 'package:fertilizer_pin/models/user/user.dart';

class PostResponse {
  Post result;

  PostResponse({required this.result});

  factory PostResponse.formJson(Map<String, dynamic> json) {
    return PostResponse(result: resultParse(json['result']));
  }

  static Post resultParse(body) {
    Post post = new Post.formJson(body);
    return post;
  }
}
