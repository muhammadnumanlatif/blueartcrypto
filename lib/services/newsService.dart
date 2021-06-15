//import '/utils/packages.dart';

import '/utils/utils.dart';
import '/utils/models.dart';
//import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class NewsService {
  static var client = http.Client();
  static Future<List<NewsModel>> fetchPosts(int categoryId) async {
    var response =
        await client.get(Uri.parse(BCIUtils.postsURL+ categoryId.toString()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = response.body;

      return postsFromJson(jsonData);
    } else {
      return [];
    }
  }
}
