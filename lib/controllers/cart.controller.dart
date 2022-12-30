import 'package:church_app/models/product.model.dart';
import 'package:get/get.dart';

class CartControllerX extends GetxController {
  RxList<Product> products = <Product>[].obs;

  addToCart(Product product) {
    products.add(product);
    update();
  }

  clearCart() {
    products.clear();
    update();
  }

  removeItem(int index) {
    products.removeAt(index);
    update();
  }
}
