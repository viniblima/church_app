import 'package:church_app/controllers/products.controllers.dart';
import 'package:church_app/models/product.model.dart';
import 'package:church_app/providers/products.provider.dart';
import 'package:church_app/widgets/skeleton_card_horizontal.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_card_horizontal.widget.dart';

class ListProductsHorizontal extends StatefulWidget {
  const ListProductsHorizontal({Key? key}) : super(key: key);

  @override
  State<ListProductsHorizontal> createState() => _ListProductsHorizontalState();
}

class _ListProductsHorizontalState extends State<ListProductsHorizontal> {
  final ProductProvider _productProvider = ProductProvider();

  final ProductControllerX _productControllerX = Get.find<ProductControllerX>();

  void onPressLike({required int index}) {
    setState(() {
      //list[index]['liked'] = !list[index]['liked'];
    });
  }

  @override
  void initState() {
    _productProvider.getHighlightProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
      ),
      height: 240,
      child: Obx(
        () => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          children: List.generate(
            !_productControllerX.loadingHighlightProducts.value
                ? _productControllerX.highlightProducts.length
                : 5,
            (int index) {
              if (_productControllerX.loadingHighlightProducts.value) {
                return const SkeletonCardHorizontal();
              } else {
                Product product = _productControllerX.highlightProducts[index];
                return ProductCardHorizontal(
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
    );
  }
}
