import 'package:church_app/widgets/product_card.widget.dart';
import 'package:flutter/material.dart';
import '../models/product.model.dart';

class ListProductsCart extends StatelessWidget {
  final List<Product> products;
  const ListProductsCart({
    required this.products,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        products.length,
        (index) {
          Product product = products[index];
          return ProductCard(product: product);
        },
      ),
    );
  }
}
