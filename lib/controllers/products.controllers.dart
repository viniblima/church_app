import 'package:church_app/models/product.model.dart';
import 'package:get/state_manager.dart';

class ProductControllerX extends GetxController {
  bool endListProducts = false;
  int page = 1;

  RxList<Product> products = RxList.empty();
  RxBool loadingListProducts = RxBool(false);
  RxBool loadingMoreProducts = RxBool(false);

  RxList<Product> highlightProducts = RxList.empty();
  RxBool loadingHighlightProducts = RxBool(false);

  int lastProductsLength = 5;
  int lastHightlightLength = 5;

  void updateProducts({required List<Product> ps}) {
    products.value = ps;
    update();
  }

  void updateloadingListProducts({required bool value}) {
    loadingListProducts.value = value;
    update();
  }

  void updateProduct({
    required int index,
    required Product p,
  }) {
    products[index] = p;
    update();
  }

  void updateloadingMoreProducts({required bool value}) {
    loadingMoreProducts.value = value;
    update();
  }

  void updateHighlightProducts({required List<Product> ps}) {
    highlightProducts.value = ps;
    update();
  }

  void updateHighlightProduct({
    required int index,
    required Product p,
  }) {
    highlightProducts[index] = p;
    update();
  }

  void updateloadingHighlight({required bool value}) {
    loadingHighlightProducts.value = value;
    update();
  }
}
