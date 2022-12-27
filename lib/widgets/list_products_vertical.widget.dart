import 'package:church_app/widgets/product_card_vertical.widget.dart';
import 'package:flutter/material.dart';

import '../models/product.model.dart';

class ListProductsVertical extends StatefulWidget {
  const ListProductsVertical({Key? key}) : super(key: key);

  @override
  State<ListProductsVertical> createState() => _ListProductVerticalState();
}

class _ListProductVerticalState extends State<ListProductsVertical> {
  //TODO: Substituir pela lista de post da API
  static List<Map<String, dynamic>> list = [
    {
      "id": "0",
      "name": "Product 0",
      "category": {
        "id": "0",
        "name": "Crescimento0",
        "color": 0xFF6BBE76,
      },
      "rate": 4.3,
      "liked": true,
      "price": 5.49,
      "quantity": 10,
    },
    {
      "id": "1",
      "name": "Product1",
      "category": {
        "id": "1",
        "name": "Crescimento1",
        "color": 0xFFFFFF00,
      },
      "rate": 4.1,
      "liked": false,
      "price": 5.49,
      "quantity": 10,
    },
    {
      "id": "2",
      "name": "Product2",
      "category": {
        "id": "2",
        "name": "Crescimento2",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
      "price": 5.49,
      "quantity": 10,
    },
    {
      "id": "3",
      "name": "Product3",
      "category": {
        "id": "3",
        "name": "Crescimento3",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": false,
      "price": 5.49,
      "quantity": 10,
    },
    {
      "id": "4",
      "name": "Product4",
      "category": {
        "id": "4",
        "name": "Crescimento4",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
      "price": 5.49,
      "quantity": 10,
    },
    {
      "id": "5",
      "name": "Product5",
      "category": {
        "id": "5",
        "name": "Crescimento5",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
      "price": 5.49,
      "quantity": 10,
    },
  ];

  void onPressLike({required int index}) {
    setState(() {
      list[index]['liked'] = !list[index]['liked'];
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
        children: List.generate(
          list.length,
          (int index) {
            Map<String, dynamic> product = list[index];
            return ProductCardVertical(
              product: Product.fromMap(product),
              onPressLike: () => onPressLike(
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
