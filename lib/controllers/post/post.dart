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
  RxBool loadingPosts = false.obs;
  var postsService = PostServeice();

  @override
  void onInit() {
    super.onInit();
    getAllPosts(true);
  }

  void getAllPosts(load) async {
    loading(load);
    loadingPosts(!load);
    final response = await postsService.getPosts(posts.length);

    if (response != null) {
      if (response is Error) {
        postError = response;
        loading(false);
        loadingPosts(false);
      } else if (response is Posts) {
        postSuccess = response;
        posts.insertAll(posts.length, response.response.results);
        loading(false);
        loadingPosts(false);
      }
    }
  }
}
