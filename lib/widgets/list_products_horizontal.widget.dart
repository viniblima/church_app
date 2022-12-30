import 'package:church_app/models/product.model.dart';
import 'package:flutter/material.dart';

import 'product_card_horizontal.widget.dart';

class ListProductsHorizontal extends StatefulWidget {
  const ListProductsHorizontal({Key? key}) : super(key: key);

  @override
  State<ListProductsHorizontal> createState() => _ListProductsHorizontalState();
}

class _ListProductsHorizontalState extends State<ListProductsHorizontal> {
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      "quantity": 10,
      "original_price": 5.49,
      "price_with_discount": 4.99,
      "percent_discount": 10.0,
      'max_quantity_installments': 10,
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
      height: 240,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          list.length,
          (int index) {
            Map<String, dynamic> product = list[index];
            return ProductCardHorizontal(
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
