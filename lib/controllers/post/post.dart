import 'package:fertilizer_pin/models/post/post.dart';
import 'package:fertilizer_pin/models/error/error.dart';
import 'package:fertilizer_pin/models/res/posts/post.dart';
import 'package:fertilizer_pin/models/res/posts/response.dart';
import 'package:fertilizer_pin/services/posts/post.dart';
import 'package:get/get.dart';

class PostController extends GetxController with StateMixin<dynamic> {
  var postSuccess =
      Posts(response: PostResponse(results: List<Post>.empty())).obs();
  RxList posts = [].obs;
  var postError = Error(success: false, message: '').obs();

  RxBool loading = false.obs;
  var postsService = PostServeice();

  @override
  void onInit() {
    super.onInit();
    getAllPosts(0);
  }

  void getAllPosts(skip) async {
    loading(true);
    final response = await postsService.getPosts(skip);

    if (response != null) {
      if (response is Error) {
        postError = response;
        loading(false);
        update();
      } else if (response is Posts) {
        postSuccess = response;
        posts.insertAll(posts.length, response.response.results);
        loading(false);
        update();
      }
    }
  }
}
