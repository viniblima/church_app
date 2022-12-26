import 'package:church_app/models/category.model.dart';

class Product {
  late String id;
  late String name;
  late Category category;
  late double rate;
  late bool liked;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.rate,
    required this.liked,
  });

  Product.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = Category.fromMap(json['category']);
    rate = json['rate'];
    liked = json['liked'];
  }
}
