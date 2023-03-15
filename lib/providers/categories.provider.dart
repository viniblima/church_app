import 'package:church_app/controllers/categories.controller.dart';
import 'package:church_app/models/category.model.dart';
import 'package:get/get.dart';

import 'http_global.provider.dart';

class CategoryProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final CategoriesControllerX _categoriesControllerX =
      Get.find<CategoriesControllerX>();

  Future<Response?> getCategories() async {
    if (_categoriesControllerX.loadingCategories.value) {
      return null;
    }

    _categoriesControllerX.updateLoadingCategories(value: true);

    Response? response = await _httpProvider.httpGet(
      address: "/category",
      protectedAPI: false,
    );
    print("category");
    print(response!.statusCode);
    if (response.statusCode == 200) {
      List<Category> cs = [];

      for (int i = 0; i < (response.body["Categories"] as List).length; i++) {
        Map<String, dynamic> json = response.body["Categories"][i];
        json["Selected"] = false;
        cs.add(Category.fromMap(json));
      }

      _categoriesControllerX.updateCategories(cs: cs);

      _categoriesControllerX.updateLoadingCategories(value: false);
    }
    return response;
  }
}
