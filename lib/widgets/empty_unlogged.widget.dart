import 'package:church_app/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import 'modal_login.widget.dart';

class EmptyUnlogged extends StatelessWidget {
  final Function onPressButton;

  const EmptyUnlogged({required this.onPressButton, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('to_view_this_area_must_be_logged'.tr),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 48,
            width: MediaQuery.of(context).size.width / 3,
            child: Button(
              onPress: () async {
                Map<String, bool>? result = await Get.bottomSheet(
                  const ModalLogin(),
                  isDismissible: true,
                );

                if (result == null || result["logged"] == false) {
                  return null;
                } else {
                  onPressButton();
                }
              },
              child: Text(
                'sign_in'.tr,
                style: TextStyle(
                    fontSize: 16, color: Config.colors[ColorVariables.white]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
