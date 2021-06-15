import 'dart:async';

import '/utils/services.dart';

import '/utils/packages.dart';
import '/utils/models.dart';

class CategoryController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<CategoryModel> categoryList = RxList<CategoryModel>();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

//https://
  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      var categories = await CategoryService.fetchCategories();
      if (categories.length > 0) {
        categoryList.clear();
        categoryList.addAll(categories);
      }
    } finally {
      isLoading(false);

    }
  }
}
