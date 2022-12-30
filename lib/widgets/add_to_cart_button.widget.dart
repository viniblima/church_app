import 'package:church_app/controllers/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../models/product.model.dart';
import 'button.widget.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;
  const AddToCartButton({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerX cartControllerX = Get.find<CartControllerX>();

    return Container(
      margin: const EdgeInsets.only(left: 8, top: 16),
      child: Button(
        onPress: () => cartControllerX.addToCart(product),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'add_to_cart'.tr,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Config.colors[ColorVariables.white],
              ),
            ),
            Container(
              width: 1,
              height: 14,
              color: Config.colors[ColorVariables.highlightPrimary]!,
            ),
            Row(
              children: <Widget>[
                Text(
                  '\$',
                  style: TextStyle(
                    color: Config.colors[ColorVariables.highlightPrimary],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  product.priceWithDiscount.toString(),
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
