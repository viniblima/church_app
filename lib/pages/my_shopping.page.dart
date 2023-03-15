import 'package:church_app/controllers/cart.controller.dart';
import 'package:church_app/controllers/login.controller.dart';
import 'package:church_app/controllers/purchase.controller.dart';
import 'package:church_app/models/purchase.model.dart';
import 'package:church_app/models/purchase_product.model.dart';
import 'package:church_app/providers/purchase.provider.dart';
import 'package:church_app/widgets/empty_unlogged.widget.dart';
import 'package:church_app/widgets/purchase_card.widget.dart';
import 'package:church_app/widgets/skeleton_purchase_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user.controller.dart';
import '../models/product.model.dart';

class MyShoppingPage extends StatefulWidget {
  const MyShoppingPage({Key? key}) : super(key: key);

  @override
  State<MyShoppingPage> createState() => _MyShoppingPageState();
}

class _MyShoppingPageState extends State<MyShoppingPage> {
  final PurchaseControllerX _purchaseControllerX =
      Get.find<PurchaseControllerX>();

  final CartControllerX _cartControllerX = Get.find<CartControllerX>();

  final PurchaseProvider _purchaseProvider = PurchaseProvider();

  Future<void> getShoppings() async {
    await _purchaseProvider.getListPurchases();
  }

  final _controller = ScrollController();

  final UserControllerX userControllerX = Get.find<UserControllerX>();

  final LoginControllerX loginControllerX = Get.find<LoginControllerX>();

  @override
  void initState() {
    if (userControllerX.token != null) {
      getInit();
    }
    _controller.addListener(() async {
      var nextPageTrigger = 0.8 * _controller.position.maxScrollExtent;

      if (_controller.position.pixels > nextPageTrigger) {
        if (_purchaseControllerX.endListPurchases ||
            _purchaseControllerX.loadingMorePurchases.value ||
            _purchaseControllerX.loadingPurchases.value ||
            !loginControllerX.logged.value) {
          return;
        } else {
          _purchaseControllerX.page++;
          await _purchaseProvider.getMorePurchases();
          //setState(() {});
        }
      }
    });
    super.initState();
  }

  getInit() {
    _purchaseProvider.getListPurchases();
  }

  void onPressButtonUnlogged() async {
    await _purchaseProvider.getListPurchases();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getShoppings(),
        child: SingleChildScrollView(
          controller: _controller,
          child: !loginControllerX.logged.value
              ? EmptyUnlogged(
                  onPressButton: onPressButtonUnlogged,
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Text('my_shopping'.tr),
                    Obx(
                      () => Column(
                        children: List.generate(
                          !_purchaseControllerX.loadingPurchases.value
                              ? _purchaseControllerX.purchases.length
                              : 5,
                          (int index) {
                            if (_purchaseControllerX.loadingPurchases.value) {
                              return const SekeletonPurchaseCard();
                            } else {
                              Purchase purchase =
                                  _purchaseControllerX.purchases[index];

                              bool isInCart = false;

                              for (PurchaseProduct element
                                  in purchase.purchasesProducts) {
                                if (!isInCart) {
                                  isInCart = _cartControllerX.mapProducts
                                      .where((Map<String, dynamic> p) {
                                        Product product =
                                            p["product"] as Product;
                                        return product.id == element.product.id;
                                      })
                                      .toList()
                                      .isNotEmpty;
                                }
                              }

                              return PurchaseCard(
                                purchase: purchase,
                                isInCart: isInCart,
                                funcUpdate: () => setState,
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    // Infinite Scroll
                    Obx(
                      () => !_purchaseControllerX.loadingMorePurchases.value ||
                              _purchaseControllerX.endListPurchases
                          ? Container()
                          : Column(
                              children: List.generate(
                                5,
                                (int index) {
                                  return const SekeletonPurchaseCard();
                                },
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 40,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
