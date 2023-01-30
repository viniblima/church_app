import 'package:church_app/models/custom_list.model.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';

class FavoriteControllerX extends GetxController {
  RxList<Product> favorites = <Product>[].obs;
  RxList<CustomList> customLists = <CustomList>[].obs;

  void addToFavorites({required Product product}) {
    favorites.add(product);
    update();
  }

  void addList({required CustomList newList}) {
    customLists.add(newList);
    update();
  }
}
