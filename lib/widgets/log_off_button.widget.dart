import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/controllers/user.controller.dart';
import 'package:church_app/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOffButton extends StatelessWidget {
  LogOffButton({
    Key? key,
  }) : super(key: key);

  final UserControllerX userControllerX = Get.find<UserControllerX>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 32,
        left: 16,
        right: 16,
      ),
      child: Button(
        type: ButtonVariables.outline,
        onPress: () async {
          await userControllerX.deleteUser();
          Get.offAndToNamed('login');
        },
        child: Center(
          child: Text(
            'exit_app'.tr,
            style: TextStyle(
              color: Config.colors[ColorVariables.primary],
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
