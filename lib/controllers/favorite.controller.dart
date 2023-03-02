import 'package:church_app/models/custom_list.model.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';

class FavoriteControllerX extends GetxController {
  RxList<Product> favorites = <Product>[].obs;
  RxList<CustomList> customLists = <CustomList>[].obs;
  RxBool loadingCustomLists = RxBool(false);

  RxBool loadingAddProductToList = RxBool(false);

  Rx<int> indexList = (-1).obs;

  void addToFavorites({required Product product}) {
    favorites.add(product);
    update();
  }

  updateIndexList({required int value}) {
    indexList.value = value;
    update();
  }

  void addList({required CustomList newList}) {
    customLists.add(newList);
    update();
  }

  void updateCustomLists({required List<CustomList> list}) {
    customLists.value = list;
    update();
  }

  void updateLoadingAddProductList({required bool value}) {
    loadingAddProductToList.value = value;
    update();
  }

  void updateLoadingCustomList({required bool value}) {
    loadingCustomLists.value = value;
    update();
  }
}
