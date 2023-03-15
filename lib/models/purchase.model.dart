import 'package:church_app/models/purchase_product.model.dart';

class Purchase {
  late DateTime createdAt;
  late String id;
  late List<PurchaseProduct> purchasesProducts;
  late bool success;

  Purchase({
    required this.createdAt,
    required this.purchasesProducts,
    required this.id,
    required this.success,
  });

  Purchase.fromMap(Map<String, dynamic> json) {
    createdAt = DateTime.parse(json["CreatedAt"]);
    id = json["ID"];
    success = json["Success"];
    purchasesProducts =
        convertList(List<Map<String, dynamic>>.from(json['PurchaseProducts']));
  }

  List<PurchaseProduct> convertList(List<Map<String, dynamic>> list) {
    List<PurchaseProduct> newList = [];

    for (int x = 0; x < list.length; x++) {
      Map<String, dynamic> json = list[x];
      newList.add(PurchaseProduct.fromMap(json));
    }

    return newList;
  }
}
