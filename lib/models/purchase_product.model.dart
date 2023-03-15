import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/models/product.model.dart';

class PurchaseProduct {
  late String id;
  late Product product;
  late StatusPurchaseProduct status;

  PurchaseProduct({
    required this.product,
    required this.id,
    required this.status,
  });

  PurchaseProduct.fromMap(Map<String, dynamic> json) {
    id = json["ID"];
    product = Product.fromMap(json["Product"]);
    status = Config.statusPurchase[json["Status"] as int] ??
        StatusPurchaseProduct.created;
  }
}
