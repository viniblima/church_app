import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';

class SelectButton extends StatelessWidget {
  final Function onPress;
  final bool selected;
  final String text;
  final bool bold;

  const SelectButton({
    required this.text,
    required this.onPress,
    required this.selected,
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
            (states) => selected
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
          backgroundColor: selected
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
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: selected
                    ? Config.colors[ColorVariables.white]
                    : Config.colors[ColorVariables.black]),
          ),
        ),
      ),
    );
  }
}
