import 'package:church_app/controllers/cart.controller.dart';
import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/models/purchase.model.dart';
import 'package:church_app/models/purchase_product.model.dart';
import 'package:church_app/utils/translations.util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/product.model.dart';

class PurchaseCard extends StatelessWidget {
  final Purchase purchase;
  final bool isInCart;
  final Function funcUpdate;

  PurchaseCard({
    required this.purchase,
    required this.isInCart,
    required this.funcUpdate,
    Key? key,
  }) : super(key: key);

  String get textButton => isInCart
      ? "remove_all_from_cart".tr
      : purchase.purchasesProducts.length > 1
          ? "add_all_to_cart".tr
          : "add_to_cart".tr;

  final CartControllerX _cartControllerX = Get.find<CartControllerX>();

  void handleProductsCart() {
    if (isInCart) {
      for (int i = 0; i < purchase.purchasesProducts.length; i++) {
        List<Map<String, dynamic>> list = _cartControllerX.mapProducts;
        int index = list.indexWhere((Map<String, dynamic> element) {
          Product product = element["product"];
          return product.id == purchase.purchasesProducts[i].product.id;
        });
        if (index > -1) {
          _cartControllerX.removeItem(
            index: index,
          );
        }
      }
    } else {
      for (int i = 0; i < purchase.purchasesProducts.length; i++) {
        _cartControllerX.addToCart(
          product: purchase.purchasesProducts[i].product,
          quantity: 1,
        );
      }
    }
    funcUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          initializeDateFormatting(TranslationService.locale.toLanguageTag()),
      builder: ((context, snapshot) {
        String date =
            "${DateFormat('dd', TranslationService.locale.toLanguageTag()).format(purchase.createdAt)} de ${DateFormat('MMMM, yyyy', TranslationService.locale.toLanguageTag()).format(purchase.createdAt)}";
        return Container(
          margin: const EdgeInsets.only(
            top: 32,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          // constraints: BoxConstraints(
          //   minHeight: 180,
          // ),
          color: Config.colors[ColorVariables.white],
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Config.colors[ColorVariables.white],
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Config.colors[ColorVariables.boxShadow]!,
                  spreadRadius: 0.2,
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            alignment: Alignment.topLeft,
            // child: RawMaterialButton(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12)),
            //   onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        date,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: TextButton(
                            onPressed: handleProductsCart,
                            child: Text(
                              textButton,
                            )),
                      )
                    ],
                  ),
                ),
                // Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(purchase.purchasesProducts.length,
                        (int index) {
                      PurchaseProduct purchaseProduct =
                          purchase.purchasesProducts[index];

                      return RawMaterialButton(
                        shape: index == purchase.purchasesProducts.length - 1
                            ? const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              )
                            : const RoundedRectangleBorder(),
                        onPressed: () => Get.toNamed(
                            '/detail_product/?product_id=${purchaseProduct.product.id}&origin=purchase&purchase_id=${purchaseProduct.id}'),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color:
                                    Config.colors[ColorVariables.borderGray]!,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 75,
                                width: 75,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    16.0,
                                  ),
                                  child: Hero(
                                    tag:
                                        'tag_${purchaseProduct.id}${purchaseProduct.product.id}_purchase',
                                    child: FadeInImage(
                                      height: 75,
                                      width: 75,
                                      fit: BoxFit.cover,
                                      imageErrorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Image.asset(
                                            'assets/images/placeholder.jpg');
                                      },
                                      image: const NetworkImage(
                                        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/1280px-A_small_cup_of_coffee.JPG',
                                      ),
                                      placeholder: const AssetImage(
                                        'assets/images/placeholder.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(Config
                                      .statusTranslated[purchaseProduct.status]!
                                      .tr),
                                  // Text("Chegou no dia"),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            //),
          ),
        );
      }),
    );
  }
}
