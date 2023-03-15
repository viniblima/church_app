import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products.controller.dart';
import '../providers/categories.provider.dart';
import '../providers/products.provider.dart';
import '../widgets/categories_slider.widget.dart';
import '../widgets/list_products_horizontal.widget.dart';
import '../widgets/list_products_vertical.widget.dart';
import '../widgets/search_posts.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductProvider _productProvider = ProductProvider();
  final CategoryProvider _categoryProvider = CategoryProvider();
  final ProductControllerX _productControllerX = Get.find<ProductControllerX>();

  Future<void> getProducts() async {
    _productControllerX.page = 1;
    _productControllerX.endListProducts = false;

    await _productProvider.getHighlightProducts();
    await _productProvider.getProducts();
    await _categoryProvider.getCategories();
  }

  final _controller = ScrollController();

  @override
  void initState() {
    _controller.addListener(() async {
      var nextPageTrigger = 0.8 * _controller.position.maxScrollExtent;

      if (_controller.position.pixels > nextPageTrigger) {
        if (_productControllerX.endListProducts ||
            _productControllerX.loadingMoreProducts.value ||
            _productControllerX.loadingListProducts.value) {
          return;
        } else {
          _productControllerX.page++;
          await _productProvider.getMoreProducts();
          //setState(() {});
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: const <Widget>[
    //       NextEvents(),
    //     ],
    //   ),
    // );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => getProducts(),
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: const <Widget>[
              SearchPosts(),
              CategoriesSlider(),
              ListProductsHorizontal(),
              ListProductsVertical(),
            ],
          ),
        ),
      ),
    );
  }
}
