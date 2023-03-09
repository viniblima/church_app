import 'package:carousel_slider/carousel_slider.dart';
import 'package:church_app/controllers/products.controllers.dart';
import 'package:church_app/models/product.model.dart';
import 'package:church_app/providers/products.provider.dart';
import 'package:church_app/widgets/skeleton_card_horizontal.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user.controller.dart';
import 'product_card_horizontal.widget.dart';

class ListProductsHorizontal extends StatefulWidget {
  const ListProductsHorizontal({Key? key}) : super(key: key);

  @override
  State<ListProductsHorizontal> createState() => _ListProductsHorizontalState();
}

class _ListProductsHorizontalState extends State<ListProductsHorizontal> {
  final ProductProvider _productProvider = ProductProvider();

  final ProductControllerX _productControllerX = Get.find<ProductControllerX>();

  @override
  void initState() {
    // _productProvider.getHighlightProducts();
    super.initState();
  }

  void onPressLike({required int index}) async {
    Product p = updateLikeInList(index: index);
    Response? response = await _productProvider.likeProduct(
      idProduct: p.id,
    );
    if (response != null && response.statusCode == 200) {
      _productControllerX.updateHighlightProduct(index: index, p: p);
    }

    UserControllerX userControllerX = Get.find<UserControllerX>();

    if (userControllerX.token == null) {
      updateLikeInList(index: index);
    }
    setState(() {});
  }

  Product updateLikeInList({required int index}) {
    List<Product> lsh = _productControllerX.highlightProducts;

    lsh[index].liked = !lsh[index].liked;

    int indexAllProducts = _productControllerX.products
        .indexWhere((Product element) => element.id == lsh[index].id);

    if (indexAllProducts > -1) {
      List<Product> ls = _productControllerX.products;
      ls[indexAllProducts].liked = !ls[indexAllProducts].liked;

      _productControllerX.updateProduct(
          index: indexAllProducts, p: ls[indexAllProducts]);
    }

    return lsh[index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
      ),
      height: 240,
      child: Obx(
        () => _productControllerX.loadingHighlightProducts.value
            ? ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: List.generate(3, (int index) {
                  return const SkeletonCardHorizontal();
                }),
              )
            : CarouselSlider(
                // shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                // // physics: const BouncingScrollPhysics(),
                options: CarouselOptions(
                  //clipBehavior: Clip.antiAlias,
                  viewportFraction: 0.4,
                  aspectRatio: 16 / 9,
                  padEnds: false,
                  enlargeCenterPage: false,
                  pageSnapping: false,
                  enableInfiniteScroll: false,
                ),

                items: List.generate(
                  !_productControllerX.loadingHighlightProducts.value
                      ? _productControllerX.highlightProducts.length
                      : _productControllerX.lastHightlightLength,
                  (int index) {
                    // if (_productControllerX.loadingHighlightProducts.value) {
                    //   return const SkeletonCardHorizontal();
                    // } else {
                    Product product =
                        _productControllerX.highlightProducts[index];
                    return ProductCardHorizontal(
                      product: product,
                      onPressLike: () => onPressLike(
                        index: index,
                      ),
                    );
                    // }
                  },
                ),
              ),
      ),
    );
  }
}
