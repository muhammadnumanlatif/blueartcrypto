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
  Future<void> fetchPosts({
    int categoryId = 1,
    int pageNumber = 0,
    int totalRecords = 1,
  }) async {
    try {
      isLoading(true);

      if (postsList.length == 0 || pageNumber == 0) {
        isLoading(true);
        postsList.clear();
      }

      if (postsList.length < totalRecords) {
        var posts = await NewsService.fetchPosts(
          pageNumber,
          categoryId,
        );
        postsList.clear();
        if (posts.length >0) {
          postsList.addAll(posts);
        }
      }
    } finally {
      isLoading(false);
    }
  }
}
