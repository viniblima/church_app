import 'package:church_app/widgets/modal_cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/cart.controller.dart';
import '../controllers/config.controller.dart';

class CartButton extends StatelessWidget {
  final double height;
  const CartButton({
    Key? key,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerX cartControllerX = Get.find<CartControllerX>();

    return Hero(
      tag: 'float_button',
      child: Stack(
        children: [
          Positioned(
            child: TextButton(
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
                  //(states) => Colors.orange,
                ),
              ),
              onPressed: () => Get.bottomSheet(
                const ModalCart(),
                isDismissible: true,
              ),
              child: Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 16,
                  color: Config.colors[ColorVariables.black],
                ),
              ),
            ),
          ),
          Positioned(
            top: 3,
            left: height / 2 - 2,
            child: Obx(
              () => cartControllerX.mapProducts.isEmpty
                  ? Container()
                  : Center(
                      child: Text(
                        cartControllerX.mapProducts.length > 9
                            ? '9+'
                            : '${cartControllerX.mapProducts.length}',
                        style: TextStyle(
                            fontSize: 8,
                            color: Config.colors[ColorVariables.black]),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerX cartControllerX = Get.find<CartControllerX>();

    return FloatingActionButton(
      heroTag: 'float_button',
      backgroundColor: Config.colors[ColorVariables.white],
      onPressed: () => Get.bottomSheet(
        const ModalCart(),
        isDismissible: true,
      ),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Center(
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 16,
                  color: Config.colors[ColorVariables.black],
                ),
              ),
            ),
            Positioned(
              top: 3,
              left: 50 / 2 - 2,
              child: Obx(
                () => cartControllerX.mapProducts.isEmpty
                    ? Container()
                    : Center(
                        child: Text(
                          cartControllerX.mapProducts.length > 9
                              ? '9+'
                              : '${cartControllerX.mapProducts.length}',
                          style: TextStyle(
                              fontSize: 8,
                              color: Config.colors[ColorVariables.black]),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
