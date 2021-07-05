import '/utils/models.dart';
import '/utils/packages.dart';
import '/utils/services.dart';

class PostDetailController extends GetxController {
  RxBool isLoading = true.obs;
  var postsModel = NewsModel().obs;
  Future<void> fetchPostDetail(int postId) async {
    try {
      isLoading(true);
      var postDetail = await NewsService.fetchPostDetails(postId);
      if (postDetail.id !=null) {
        postsModel.value = postDetail;
      }
    } finally {
      isLoading(false);
    }
  }
}
