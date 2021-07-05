import '/utils/utils.dart';
import '/utils/models.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static var client = http.Client();
  static Future<List<NewsModel>> fetchPosts(
    int pageNumber,
    int categoryId,
  ) async {
    
      var response = await client.get(Uri.parse(BCIUtils.postsURL +
          categoryId.toString() +
          "&page_no=" +
          pageNumber.toString()));
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonData = response.body;

        return postsFromJson(jsonData);
      }
    
    return [];
  }

  static Future<NewsModel> fetchPostDetails(int postId) async {
    NewsModel news = NewsModel();
  
      var response = await client
          .get(Uri.parse(BCIUtils.postDetailsURL + postId.toString()));
      if (response.statusCode == 200) {
        var jsonData = response.body;

        return postDetailsFromJson(jsonData);
      }
    return news;
  }
}
