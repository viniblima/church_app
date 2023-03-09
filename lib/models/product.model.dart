import 'package:church_app/models/category.model.dart';
import 'package:church_app/models/discount.model.dart';

class Product {
  late String id;
  late String name;
  late Category? category;
  late double? rate;
  late bool liked;
  late double price;

  late int quantity;
  late int maxQuantityInstallments;

  late Discount? discount;

  Product({
    required this.id,
    required this.name,
    this.category,
    required this.rate,
    required this.liked,
    required this.price,
    required this.quantity,
    this.discount,
    required this.maxQuantityInstallments,
  });

  Product.fromMap(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    //category = Category.fromMap(json['category']);
    rate = json['rate'];
    liked = json['Like'];
    price = json['Price'].runtimeType == int
        ? double.parse(json['Price'].toString())
        : json['Price'];
    discount =
        json['Discount'] != null ? Discount.fromMap(json['Discount']) : null;
    quantity = json['Quantity'];
    maxQuantityInstallments = json['MaxQuantityInstallments'];
  }
}
