import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/about_product.widget.dart';
import 'package:church_app/widgets/add_to_cart_button.widget.dart';
import 'package:church_app/widgets/cart_button.widget.dart';
import 'package:church_app/widgets/like_button.widget.dart';
import 'package:church_app/widgets/related_products.widget.dart';
import 'package:church_app/widgets/size_guide_button.widget.dart';
import 'package:church_app/widgets/size_slider.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/product.model.dart';
import '../widgets/custom_back_button.widget.dart';
import '../widgets/list_products_horizontal.widget.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late Product product;

  @override
  void initState() {
    product = Get.arguments['product'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingCartButton(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Hero(
                      tag: 'tag${product.id}',
                      child: FadeInImage(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                          return Image.asset('assets/images/placeholder.jpg');
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
                  const Positioned(
                    top: 8,
                    left: 8,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CustomBackButton(),
                    ),
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: LikeButton(
                        onPressLike: () {},
                        liked: true,
                      ),
                    ),
                  ),
                  /* const Positioned(
                    right: 8,
                    top: 8,
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CartButton(),
                    ),
                  ), */
                ],
              ),
            ),
            Container(
              color: Config.colors[ColorVariables.backgroundGray],
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Config.colors[ColorVariables.highlightGray],
                        borderRadius: BorderRadius.circular(
                          32.0,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Config.colors[ColorVariables.highlightGray],
                            ),
                            child: const Text('Coffee'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Config.colors[ColorVariables.highlightGray],
                            ),
                            child: const Text('Chocolate'),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color:
                                  Config.colors[ColorVariables.highlightGray],
                            ),
                            child: const Text('Medium roasted'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const SizeSelector(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const SizeGuideButton(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: const AboutProduct(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    margin: const EdgeInsets.only(top: 24),
                    height: 64,
                    child: AddToCartButton(
                      product: product,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const RelatedProducts(),
                  const SizedBox(
                    height: 48,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //     (BuildContext context, int index) {
      //       return Container(
      //         color: Colors.orange,
      //         margin: EdgeInsets.only(
      //           bottom: 16,
      //         ),
      //         height: 100,
      //         child: Center(child: Text('item $index')),
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
