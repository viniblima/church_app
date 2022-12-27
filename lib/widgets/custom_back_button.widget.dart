import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
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
          (states) => Config.colors[ColorVariables.white]!,
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (states) => Config.colors[ColorVariables.white]!,
        ),
      ),
      onPressed: () => Get.back(),
      child: Center(
        child: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: Config.colors[ColorVariables.black],
        ),
      ),
    );
  }
}
