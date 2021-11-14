import 'package:fertilizer_pin/models/post/post.dart';
import 'package:fertilizer_pin/models/user/user.dart';

class PostResponse {
  List<Post> results;

  PostResponse({required this.results});

  factory PostResponse.formJson(Map<String, dynamic> json) {
    return PostResponse(results: resultParse(json['results']));
  }

  static List<Post> resultParse(body) {
    var list = body as List;
    List<Post> posts = list.map((e) => Post.formJson(e)).toList();
    return posts;
  }
}
