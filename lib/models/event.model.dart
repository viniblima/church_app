class Event {
  late String id;
  late String name;
  late DateTime date;

  Event({
    required this.name,
    required this.date,
  });

  Event.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['id'];
    date = DateTime.parse(json['date']);
  }
}
