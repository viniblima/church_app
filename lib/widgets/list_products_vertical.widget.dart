import 'package:church_app/widgets/product_card_vertical.widget.dart';
import 'package:church_app/widgets/skeleton_card_vertical.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products.controllers.dart';
import '../models/product.model.dart';
import '../providers/products.provider.dart';

class ListProductsVertical extends StatefulWidget {
  const ListProductsVertical({Key? key}) : super(key: key);

  @override
  State<ListProductsVertical> createState() => _ListProductVerticalState();
}

class _ListProductVerticalState extends State<ListProductsVertical> {
  final ProductProvider _productProvider = ProductProvider();

  final ProductControllerX _productControllerX = Get.find<ProductControllerX>();

  @override
  void initState() {
    _productProvider.getProducts();
    super.initState();
  }

  void onPressLike({required int index}) {
    setState(() {
      //list[index]['liked'] = !list[index]['liked'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          Obx(
            () => Column(
              children: List.generate(
                !_productControllerX.loadingListProducts.value
                    ? _productControllerX.products.length
                    : 5,
                (int index) {
                  if (_productControllerX.loadingListProducts.value) {
                    return const SkeletonCardVertical();
                  } else {
                    Product product = _productControllerX.products[index];
                    return ProductCardVertical(
                      product: product,
                      onPressLike: () => onPressLike(
                        index: index,
                      ),
                    );
                  }
                },
              ),
            ),
          ),

          // Infinite Scroll
          Obx(
            () => _productControllerX.loadingMoreProducts.value ||
                    _productControllerX.endListProducts
                ? Container()
                : Column(
                    children: List.generate(
                      5,
                      (int index) {
                        return const SkeletonCardVertical();
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
