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

  void updateProducts({required List<Product> ps}) {
    products.value = ps;
    update();
  }

  void updateloadingListProducts({required bool value}) {
    loadingListProducts.value = value;
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

  void updateloadingHighlight({required bool value}) {
    loadingHighlightProducts.value = value;
    update();
  }
}
