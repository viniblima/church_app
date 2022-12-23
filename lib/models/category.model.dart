class Category {
  late String id;
  late String name;
  late int color;

  Category({
    required this.id,
    required this.name,
    required this.color,
  });

  Category.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = int.parse(json['color'].toString().replaceAll('#', '0xFF'));
  }
}
