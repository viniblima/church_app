import 'package:church_app/widgets/categories_slider.widget.dart';
import 'package:church_app/widgets/list_products_horizontal.widget.dart';

import 'package:church_app/widgets/search_posts.widget.dart';
import 'package:flutter/material.dart';

import '../widgets/list_products_vertical.widget.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SearchPosts(),
            CategoriesSlider(),
            ListProductsHorizontal(),
            ListProductsVertical(),
          ],
        ),
      ),
    );
  }
}
