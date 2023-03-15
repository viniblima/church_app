import 'package:church_app/models/purchase.model.dart';
import 'package:get/state_manager.dart';

class PurchaseControllerX extends GetxController {
  RxList<Purchase> purchases = <Purchase>[].obs;
  RxBool loadingPurchases = RxBool(false);
  RxBool loadingMorePurchases = RxBool(false);
  RxBool sendingPurchase = RxBool(false);

  bool endListPurchases = false;
  int page = 1;

  void updatePurchases({required List<Purchase> ps}) {
    purchases.value = ps;
    update();
  }

  void updateLoadingPurchases({required bool tag}) {
    loadingPurchases.value = tag;
    update();
  }

  void updateLoadingMorePurchases({required bool tag}) {
    loadingMorePurchases.value = tag;
    update();
  }

  void updateSendingPurchase({required bool value}) {
    sendingPurchase.value = value;
    update();
  }
}
