import 'dart:async';
import '/utils/models.dart';
import '/utils/packages.dart';
import '/services/newsService.dart';

class PostsController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<NewsModel> postsList = RxList<NewsModel>();

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

//https://
  Future<void> fetchPosts({int categoryId=1}) async {
    try {
      isLoading(true);
      var posts = await NewsService.fetchPosts(categoryId);
        postsList.clear();
      if (posts.length>0) {
        postsList.addAll(posts);
      }
    } finally {
      isLoading(false);
    }
  }
}
