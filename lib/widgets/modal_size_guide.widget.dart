import 'package:flutter/material.dart';
import '../controllers/config.controller.dart';

class ModalSizeGuide extends StatelessWidget {
  const ModalSizeGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Config.colors[ColorVariables.white],
      ),
      height: 400,
      padding: const EdgeInsets.only(top: 16),
    );
  }
}
