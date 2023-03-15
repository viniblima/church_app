import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';

import '../models/category.model.dart';

class SelectButton extends StatelessWidget {
  final Function onPress;
  final Category category;
  final bool bold;

  const SelectButton({
    required this.category,
    required this.onPress,
    this.bold = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) => category.selected
                ? Config.colors[ColorVariables.white]!
                : Config.colors[ColorVariables.primary]!,
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.all(8),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(
                color: Config.colors[ColorVariables.borderGray]!,
              ),
            ),
          ),
          backgroundColor: category.selected
              ? MaterialStateProperty.resolveWith<Color>(
                  (states) => Config.colors[ColorVariables.primary]!,
                )
              : MaterialStateProperty.resolveWith<Color>(
                  (states) => Config.colors[ColorVariables.white]!,
                ),
        ),
        onPressed: () => onPress(),
        child: Center(
          child: Text(
            category.name,
            style: TextStyle(
                fontSize: 14,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: category.selected
                    ? Config.colors[ColorVariables.white]
                    : Config.colors[ColorVariables.black]),
          ),
        ),
      ),
    );
  }
}
