import '/utils/utils.dart';
import '/utils/models.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  static var client = http.Client();
  static Future<List<CategoryModel>> fetchCategories() async {
    var response =
        await client.get(Uri.parse(BCIUtils.apiURL+BCIUtils.categoryURL));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var jsonData = response.body;

      return categoryModelFromJson(jsonData);
    } else {
      return [];
    }
  }
}
