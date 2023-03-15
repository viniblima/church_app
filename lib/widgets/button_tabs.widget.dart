import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonTabs extends StatelessWidget {
  final String name;
  final IconData icon;

  const ButtonTabs({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            child: Icon(
              icon,
            ),
          ),
          Text(
            name.tr,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
