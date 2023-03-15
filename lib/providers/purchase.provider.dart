import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/controllers/purchase.controller.dart';
import 'package:church_app/models/purchase.model.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';
import 'http_global.provider.dart';

class PurchaseProvider extends GetConnect {
  final HttpProvider _httpProvider = HttpProvider();

  final PurchaseControllerX _purchaseControllerX =
      Get.find<PurchaseControllerX>();

  Future<Response?> getListPurchases() async {
    if (_purchaseControllerX.loadingPurchases.value) {
      return null;
    }

    _purchaseControllerX.updateLoadingPurchases(tag: true);

    Response? response = await _httpProvider.httpGet(
      address: "/purchase/?page=${_purchaseControllerX.page}",
    );

    if (response!.statusCode == 200) {
      _purchaseControllerX.endListPurchases = response.body["End"];
      List<Purchase> ps = [];

      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(response.body["Purchases"]);

      for (int i = 0; i < list.length; i++) {
        ps.add(Purchase.fromMap(list[i]));
      }

      _purchaseControllerX.updatePurchases(ps: ps);
    }

    _purchaseControllerX.updateLoadingPurchases(tag: false);

    return response;
  }

  Future<Response?> getMorePurchases() async {
    if (_purchaseControllerX.loadingMorePurchases.value ||
        _purchaseControllerX.endListPurchases) {
      return null;
    }

    _purchaseControllerX.updateLoadingMorePurchases(tag: true);

    Response? response = await _httpProvider.httpGet(
      address: "/purchase/?page=${_purchaseControllerX.page}",
    );

    if (response!.statusCode == 200) {
      _purchaseControllerX.endListPurchases = response.body["End"];

      List<Purchase> ps = _purchaseControllerX.purchases;

      List<Map<String, dynamic>> list =
          List<Map<String, dynamic>>.from(response.body["Purchases"]);

      for (int i = 0; i < list.length; i++) {
        ps.add(
          Purchase.fromMap(
            list[i],
          ),
        );
      }
    }

    _purchaseControllerX.updateLoadingMorePurchases(tag: false);

    return response;
  }

  Future<Response?> makePurchase({
    required PaymentMethods method,
    required List<Map<String, dynamic>> products,
    int installments = 1,
  }) async {
    if (_purchaseControllerX.sendingPurchase.value) {
      return null;
    }

    _purchaseControllerX.updateSendingPurchase(value: true);

    Response? response = await _httpProvider.httpPost(
      address: "/purchase",
      obj: {
        "PaymentMethod": {
          "Name": Config.paymentMap[method]!["value"],
          "Installments": installments,
        },
        "Products": products,
      },
    );

    return response;
  }
}
