import 'package:church_app/widgets/button.widget.dart';
import 'package:church_app/widgets/cart_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cart.controller.dart';
import '../controllers/config.controller.dart';
import '../models/product.model.dart';

class ModalCart extends StatefulWidget {
  const ModalCart({Key? key}) : super(key: key);

  @override
  State<ModalCart> createState() => _ModalCartState();
}

class _ModalCartState extends State<ModalCart> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;

    CartControllerX cartControllerX = Get.find<CartControllerX>();

    for (Product element in cartControllerX.products) {
      totalPrice += element.priceWithDiscount;
    }

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
      child: Scaffold(
        body: Obx(
          () => cartControllerX.products.isEmpty
              ? Center(
                  child: Text('your_cart_is_empty'.tr),
                )
              : ListView(
                  shrinkWrap: true,
                  children: List.generate(
                    cartControllerX.products.length,
                    (int index) {
                      Product product = cartControllerX.products[index];

                      return CartItem(
                        product: product,
                        onPressExclude: () {
                          setState(
                            () {
                              cartControllerX.removeItem(index: index);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 16,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Total'),
                    Text(
                      NumberFormat.simpleCurrency(locale: Get.locale.toString())
                          .format(totalPrice),
                      style: TextStyle(
                          color: Config.colors[ColorVariables.primary]),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      child: Button(
                        onPress: () => Get.back(),
                        type: ButtonVariables.outline,
                        child: Text(
                          'keep_shopping'.tr,
                          style: TextStyle(
                            color: Config.colors[ColorVariables.primary],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 32,
                      child: Button(
                        onPress: () {
                          Get.back();
                          Get.toNamed('payment_methods');
                        },
                        disabled: cartControllerX.products.isEmpty,
                        child: Text(
                          'checkout'.tr.toUpperCase(),
                          style: TextStyle(
                            color: Config.colors[ColorVariables.white],
                            //fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
