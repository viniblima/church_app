import 'package:church_app/models/product.model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> productMap;
  final int index;
  const ProductCard({
    required this.productMap,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product product = productMap["product"] as Product;

    return Text(product.name);
  }
}
