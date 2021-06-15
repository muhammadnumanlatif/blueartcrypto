import 'dart:async';

import '/services/newsService.dart';

import '/utils/packages.dart';
import '/utils/models.dart';

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
