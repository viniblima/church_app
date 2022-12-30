import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';

class LikeButton extends StatelessWidget {
  final Function onPressLike;
  final bool liked;
  final LikeButtonSize size;
  const LikeButton({
    required this.onPressLike,
    required this.liked,
    this.size = LikeButtonSize.medium,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<LikeButtonSize, double> sizeMap = {
      LikeButtonSize.small: 12,
      LikeButtonSize.medium: 16,
    };

    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
              color: liked
                  ? Config.colors[ColorVariables.primary]!
                  : Config.colors[ColorVariables.black]!,
              width: 1,
            ),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
          const EdgeInsets.all(0),
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
          liked ? Icons.favorite : Icons.favorite_outline,
          size: sizeMap[size],
          color: liked
              ? Config.colors[ColorVariables.white]
              : Config.colors[ColorVariables.black],
        ),
      ),
    );
  }
}

enum LikeButtonSize {
  small,
  medium,
}
