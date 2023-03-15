import 'package:church_app/controllers/favorite.controller.dart';
import 'package:church_app/providers/favorite.provider.dart';
import 'package:church_app/widgets/card_liked_product.widget.dart';
import 'package:church_app/widgets/skeleton_liked_product.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';
import '../providers/products.provider.dart';

class LikedProducts extends StatefulWidget {
  const LikedProducts({Key? key}) : super(key: key);

  @override
  State<LikedProducts> createState() => _LikedProductsState();
}

class _LikedProductsState extends State<LikedProducts> {
  final FavoriteControllerX _favoriteControllerX =
      Get.find<FavoriteControllerX>();

  final FavoriteProvider _favoriteProvider = FavoriteProvider();
  final ProductProvider _productProvider = ProductProvider();

  @override
  void initState() {
    _favoriteProvider.getLikedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'liked_products'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => Column(
              children: [
                ...List.generate(
                  !_favoriteControllerX.loadingFavorites.value
                      ? _favoriteControllerX.favorites.length
                      : 5,
                  (index) {
                    if (_favoriteControllerX.loadingFavorites.value) {
                      return const SkeletonLikedProuct();
                    } else {
                      Product product = _favoriteControllerX.favorites[index];

                      return CardLikedProduct(
                        product: product,
                        onDismiss: () async {
                          await _productProvider.likeProduct(
                              idProduct: product.id);
                          await _favoriteProvider.getLikedProducts();
                          setState(() {});
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Obx(
            () => SizedBox(
              height: 200,
              child: !_favoriteControllerX.loadingFavorites.value &&
                      _favoriteControllerX.favorites.isEmpty
                  ? Center(
                      child: Text(
                        "no_liked_products".tr,
                        style: const TextStyle(),
                      ),
                    )
                  : null,
            ),
          )
        ],
      ),
    );
  }
}
