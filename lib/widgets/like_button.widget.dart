import 'package:flutter/material.dart';

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
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
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
          size: 16,
          color: liked
              ? Config.colors[ColorVariables.white]
              : Config.colors[ColorVariables.black],
        ),
      ),
    );
  }
}
