import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controllers/config.controller.dart';

class LikeButton extends StatelessWidget {
  final Function onPressLike;
  final bool liked;
  const LikeButton({
    required this.onPressLike,
    required this.liked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) => liked
                ? Config.colors[ColorVariables.white]!
                : Config.colors[ColorVariables.primary]!,
          ),
          backgroundColor: liked
              ? MaterialStateProperty.resolveWith<Color>(
                  (states) => liked
                      ? Config.colors[ColorVariables.primary]!
                      : Config.colors[ColorVariables.white]!,
                )
              : MaterialStateProperty.resolveWith<Color>(
                  (states) => Config.colors[ColorVariables.white]!,
                ),
        ),
        onPressed: () => onPressLike(),
        child: Center(
          child: Icon(
            Icons.favorite,
            size: 20,
            color: liked
                ? Config.colors[ColorVariables.white]
                : Config.colors[ColorVariables.black],
          ),
        ),
      ),
    );
  }
}
