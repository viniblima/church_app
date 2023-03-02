import 'package:church_app/models/product.model.dart';
import 'package:church_app/widgets/modal_options_product.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class OptionsButton extends StatelessWidget {
  final OptionsButtonSize size;
  final Product product;
  const OptionsButton({
    required this.product,
    this.size = OptionsButtonSize.medium,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<OptionsButtonSize, double> sizeMap = {
      OptionsButtonSize.small: 12,
      OptionsButtonSize.medium: 16,
    };

    return TextButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: Config.colors[ColorVariables.primary]!,
                width: 1,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
            const EdgeInsets.all(0),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Config.colors[ColorVariables.white]!,
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => Config.colors[ColorVariables.primary]!,
          )),
      onPressed: () => Get.bottomSheet(
        ModalOptionProduct(
          product: product,
        ),
        isDismissible: true,
      ),
      child: RotationTransition(
        turns: new AlwaysStoppedAnimation(90 / 360),
        child: Center(
          child: Icon(
            Icons.more_horiz,
            size: sizeMap[size],
            color: Config.colors[ColorVariables.white],
          ),
        ),
      ),
    );
  }
}

enum OptionsButtonSize {
  small,
  medium,
}
