import 'package:church_app/widgets/post_card_horizontal.widget.dart';
import 'package:church_app/widgets/post_card_vertical.widget.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';
import '../models/product.model.dart';

class ListItemVertical extends StatefulWidget {
  const ListItemVertical({Key? key}) : super(key: key);

  @override
  State<ListItemVertical> createState() => _ListItemVerticalState();
}

class _ListItemVerticalState extends State<ListItemVertical> {
  //TODO: Substituir pela lista de post da API
  static List<Map<String, dynamic>> list = [
    {
      "id": "0",
      "name": "Post 0",
      "category": {
        "id": "0",
        "name": "Crescimento0",
        "color": 0xFF6BBE76,
      },
      "rate": 4.3,
      "liked": true,
    },
    {
      "id": "1",
      "name": "Post1",
      "category": {
        "id": "1",
        "name": "Crescimento1",
        "color": 0xFFFFFF00,
      },
      "rate": 4.1,
      "liked": false,
    },
    {
      "id": "2",
      "name": "Post2",
      "category": {
        "id": "2",
        "name": "Crescimento2",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
    },
    {
      "id": "3",
      "name": "Post3",
      "category": {
        "id": "3",
        "name": "Crescimento3",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": false,
    },
    {
      "id": "4",
      "name": "Post4",
      "category": {
        "id": "4",
        "name": "Crescimento4",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
    },
    {
      "id": "5",
      "name": "Post5",
      "category": {
        "id": "5",
        "name": "Crescimento5",
        "color": 0xFFFFF000,
      },
      "rate": 4.3,
      "liked": true,
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
            return PostCardVertical(
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
