import 'package:church_app/widgets/modal_list_custom_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../models/product.model.dart';

class ModalOptionProduct extends StatelessWidget {
  final Product product;
  const ModalOptionProduct({
    required this.product,
    Key? key,
  }) : super(key: key);

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
      height: 200,
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              Get.back();
              Get.bottomSheet(
                ModalListCustomList(
                  product: product,
                ),
                isDismissible: true,
              );
            },
            child: ListTile(
              title: Text('add_to_list'.tr),
              subtitle: Text('add_to_one_of_your_lists'.tr),
              contentPadding: const EdgeInsets.all(16),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
    );
  }
}
