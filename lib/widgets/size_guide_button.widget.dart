import 'package:church_app/widgets/button.widget.dart';
import 'package:church_app/widgets/modal_size_guide.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class SizeGuideButton extends StatelessWidget {
  const SizeGuideButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Button(
      onPress: () => Get.bottomSheet(
        const ModalSizeGuide(),
        isDismissible: true,
      ),
      type: ButtonVariables.outline,
      format: ButtonFormat.square,
      child: Center(
        child: Text(
          'size_guide'.tr,
          style: TextStyle(
            color: Config.colors[ColorVariables.primary],
            fontSize: 16,
            decoration: TextDecoration.underline,
            decorationColor: Config.colors[ColorVariables.primary],
          ),
        ),
      ),
    );
  }
}
