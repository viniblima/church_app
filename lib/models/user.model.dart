class User {
  late String id;
  late String name;
  late String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  User.fromMap(Map<String, dynamic> json) {
    id = json['ID'];
    name = json['Name'];
    email = json['Email'];
  }
}
