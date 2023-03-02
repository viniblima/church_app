import 'package:church_app/models/product.model.dart';

class CustomList {
  late String id;
  late String name;
  late List<Product> products;

  CustomList({
    required this.id,
    required this.name,
    required this.products,
  });

  CustomList.fromMap(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    products = convertList(json['Products']);
  }

  List<Product> convertList(List<Map<String, dynamic>> list) {
    List<Product> newList = [];

    for (int x = 0; x < list.length; x++) {
      Map<String, dynamic> json = list[x];
      newList.add(Product.fromMap(json));
    }

    return newList;
  }
}
