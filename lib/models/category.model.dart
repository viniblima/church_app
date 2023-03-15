class Category {
  late String id;
  late String name;
  // late int color;
  late bool selected;

  Category({
    required this.id,
    required this.name,
    // required this.color,
    required this.selected,
  });

  Category.fromMap(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    selected = json['Selected'];
    // color = int.parse(json['color'].toString().replaceAll('#', '0xFF'));
  }
}
