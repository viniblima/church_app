import 'package:church_app/widgets/product_card.widget.dart';
import 'package:flutter/material.dart';

class ListProductsCart extends StatelessWidget {
  final List<Map<String, dynamic>> productsMap;
  const ListProductsCart({
    required this.productsMap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        productsMap.length,
        (index) {
          return ProductCard(
            productMap: productsMap[index],
            index: index,
          );
        },
      ),
    );
  }
}
