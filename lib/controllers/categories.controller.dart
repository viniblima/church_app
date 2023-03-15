import 'package:get/get.dart';

import '../models/category.model.dart';

class CategoriesControllerX extends GetxController {
  RxBool loadingCategories = RxBool(false);

  RxList<Category> categories = <Category>[].obs;

  void updateLoadingCategories({required bool value}) {
    loadingCategories.value = value;
    update();
  }

  void updateCategories({required List<Category> cs}) {
    categories.value = cs;
    update();
  }

  void updateCategory({
    required int index,
    required Category c,
  }) {
    categories[index] = c;
    update();
  }
}
