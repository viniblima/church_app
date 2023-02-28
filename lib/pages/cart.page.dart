import 'package:church_app/controllers/cart.controller.dart';
import 'package:church_app/widgets/list_products_cart.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_bar_tabs.widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartControllerX cartControllerX = Get.find<CartControllerX>();

    return Scaffold(
      appBar: AppBarTabs(
        title: 'titulo',
        onPressLeading: () => {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(
              () => cartControllerX.products.isEmpty
                  ? const Text('vazio')
                  : ListProductsCart(
                      products: cartControllerX.products,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
