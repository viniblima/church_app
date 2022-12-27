import 'package:church_app/controllers/cart.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../models/product.model.dart';

class AddToCartButton extends StatelessWidget {
  final Function onPress;
  final Product product;
  const AddToCartButton({
    required this.onPress,
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerX cartControllerX = Get.find<CartControllerX>();

    return Container(
      margin: const EdgeInsets.only(left: 8, top: 16),
      child: TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (states) => Config.colors[ColorVariables.white]!),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
              const EdgeInsets.all(16),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
                side: BorderSide(
                  color: Config.colors[ColorVariables.borderGray]!,
                ),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Config.colors[ColorVariables.primary]!,
            )),
        onPressed: () => cartControllerX.addToCart(product),
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
                  product.price.toString(),
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
