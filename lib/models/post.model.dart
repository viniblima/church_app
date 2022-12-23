import 'package:church_app/models/category.model.dart';

class Post {
  late String id;
  late String name;
  late Category category;
  late double rate;
  late bool liked;

  Post({
    required this.id,
    required this.name,
    required this.category,
    required this.rate,
    required this.liked,
  });

  Post.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = Category.fromMap(json['category']);
    rate = json['rate'];
    liked = json['liked'];
  }
}
