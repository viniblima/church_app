import 'package:church_app/models/product.model.dart';
import 'package:get/get.dart';

class CartControllerX extends GetxController {
  RxList<Map<String, dynamic>> mapProducts = <Map<String, dynamic>>[].obs;

  void addToCart({required Product product, required int quantity}) {
    mapProducts.add({
      "product": product,
      "quantity": quantity,
    });
    update();
  }

  void updateItemCart({required int index, required int quantity}) {
    mapProducts[index]["quantity"] = quantity;
    update();
  }

  void clearCart() {
    mapProducts.clear();
    update();
  }

  void removeItem({required int index}) {
    mapProducts.removeAt(index);
    update();
  }
}
