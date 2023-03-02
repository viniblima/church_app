import 'package:flutter/cupertino.dart';

class PaymentMethod {
  late String name;
  late Function onPress;
  late IconData icon;

  PaymentMethod({
    required this.name,
    required this.onPress,
    required this.icon,
  });

  PaymentMethod.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    onPress = json['on_press'];
    icon = json['icon'];
  }
}
