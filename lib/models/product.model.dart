import 'package:church_app/models/category.model.dart';

class Product {
  late String id;
  late String name;
  late Category category;
  late double rate;
  late bool liked;
  late double originalPrice;
  late double priceWithDiscount;
  late double percentDiscount;
  late int quantity;
  late int maxQuantityInstallments;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.rate,
    required this.liked,
    required this.originalPrice,
    required this.priceWithDiscount,
    required this.percentDiscount,
    required this.quantity,
    required this.maxQuantityInstallments,
  });

  Product.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = Category.fromMap(json['category']);
    rate = json['rate'];
    liked = json['liked'];
    originalPrice = json['original_price'];
    priceWithDiscount = json['price_with_discount'];
    percentDiscount = json['percent_discount'];
    quantity = json['quantity'];
    maxQuantityInstallments = json['max_quantity_installments'];
  }
}
