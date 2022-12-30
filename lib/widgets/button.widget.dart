import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';

class Button extends StatelessWidget {
  final Function onPress;
  final ButtonVariables type;
  final ButtonFormat format;
  final Widget child;
  final bool disabled;

  const Button({
    required this.onPress,
    required this.child,
    this.disabled = false,
    this.type = ButtonVariables.background,
    this.format = ButtonFormat.rounded,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<ButtonVariables, Map<String, Color>> configMap = {
      ButtonVariables.background: {
        'overlay': Config.colors[ColorVariables.white]!,
        'background': Config.colors[ColorVariables.primary]!,
        'border_color': Config.colors[ColorVariables.primary]!
      },
      ButtonVariables.outline: {
        'overlay': Config.colors[ColorVariables.primary]!,
        'background': Config.colors[ColorVariables.white]!,
        'border_color': Config.colors[ColorVariables.primary]!
      },
      ButtonVariables.text: {
        'overlay': Config.colors[ColorVariables.primary]!,
        'background': Config.colors[ColorVariables.white]!,
        'border_color': Config.colors[ColorVariables.white]!
      }
    };

    Map<ButtonFormat, double> formatMap = {
      ButtonFormat.square: 6.0,
      ButtonFormat.rounded: 32.0,
    };

    Map<String, Color> config = configMap[type]!;
    double borderRadius = formatMap[format]!;

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (states) => disabled ? Colors.transparent : config['overlay']!,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: config['border_color']!.withOpacity(disabled ? 0 : 1),
              width: 1,
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => config['background']!.withOpacity(disabled ? 0.5 : 1),
        ),
      ),
      onPressed: () {
        if (disabled) {
          return;
        }

        onPress();
      },
      child: child,
    );
  }
}

enum ButtonVariables {
  background,
  outline,
  text,
}

enum ButtonFormat {
  square,
  rounded,
}
