import 'package:church_app/controllers/user.controller.dart';
import 'package:church_app/widgets/product_card_vertical.widget.dart';
import 'package:church_app/widgets/skeleton_card_vertical.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../controllers/products.controller.dart';
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
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 0);

  void onPressLike({required int index}) async {
    Product p = updateLikeInList(index: index);
    Response? response = await _productProvider.likeProduct(
      idProduct: p.id,
    );
    if (response != null && response.statusCode == 200) {
      _productControllerX.updateProduct(index: index, p: p);
    }

    UserControllerX userControllerX = Get.find<UserControllerX>();

    if (userControllerX.token == null) {
      updateLikeInList(index: index);
    }
    setState(() {});
  }

  Product updateLikeInList({required int index}) {
    List<Product> ls = _productControllerX.products;

    ls[index].liked = !ls[index].liked;

    int indexHighlights = _productControllerX.highlightProducts
        .indexWhere((Product element) => element.id == ls[index].id);

    if (indexHighlights > -1) {
      List<Product> lsh = _productControllerX.highlightProducts;
      lsh[indexHighlights].liked = !lsh[indexHighlights].liked;
      _productControllerX.updateHighlightProduct(
        index: indexHighlights,
        p: lsh[indexHighlights],
      );
    }

    return ls[index];
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final List<Product> newItems = await _productProvider.getProducts();

      if (_productControllerX.endListProducts) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;

        _productControllerX.page += 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      margin: const EdgeInsets.only(
        top: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PagedListView(
        // physics: NeverScrollableScrollPhysics(),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Product>(
          itemBuilder: (BuildContext context, Product product, int index) =>
              ProductCardVertical(
            product: product,
            onPressLike: () => onPressLike(
              index: index,
            ),
          ),
          newPageProgressIndicatorBuilder: (_) => Column(
            children: List.generate(
              5,
              (int index) => const SkeletonCardVertical(),
            ),
          ),
        ),
      ),
      // child: Column(
      //   children: [
      //     FutureBuilder(
      //       future: _productProvider.getProducts(),
      //       builder: (BuildContext context, AsyncSnapshot snapshot) {
      //         if (snapshot.connectionState == ConnectionState.done) {
      //           return Column(
      //             children: List.generate(
      //               _productControllerX.products.length,
      //               (int index) {
      //                 Product product = _productControllerX.products[index];
      // return ProductCardVertical(
      //   product: product,
      //   onPressLike: () => onPressLike(
      //     index: index,
      //   ),
      // );
      //               },
      //             ),
      //           );
      //         } else {
      //           return Column(
      //             children: List.generate(
      //               5,
      //               (int index) {
      //                 return const SkeletonCardVertical();
      //               },
      //             ),
      //           );
      //         }
      //       },
      //     ),
      //     // child: Obx(() => !_productControllerX.loadingListProducts.value
      //     //         ? Column(
      //     //             children: List.generate(
      //     //               _productControllerX.products.length,
      //     //               (int index) {
      //     //                 Product product = _productControllerX.products[index];
      //     //                 return ProductCardVertical(
      //     //                   product: product,
      //     //                   onPressLike: () => onPressLike(
      //     //                     index: index,
      //     //                   ),
      //     //                 );
      //     //               },
      //     //             ),
      //     //           )
      //     //         : Container(
      //     //             child: Text("teste"),
      //     //           )

      //     // // Infinite Scroll
      //     Obx(
      //       () => _productControllerX.loadingMoreProducts.value ||
      //               _productControllerX.endListProducts
      //           ? Container()
      //           : Column(
      //               children: List.generate(
      //                 5,
      //                 (int index) {
      //                   return const SkeletonCardVertical();
      //                 },
      //               ),
      //             ),
      //     ),
      //   ],
      // ),
      // // ),
    );
  }
}
