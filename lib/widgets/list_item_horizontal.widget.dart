import 'package:church_app/models/product.model.dart';
import 'package:church_app/widgets/post_card_horizontal.widget.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class ListItemHorizontal extends StatefulWidget {
  const ListItemHorizontal({Key? key}) : super(key: key);

  @override
  State<ListItemHorizontal> createState() => _ListItemHorizontalState();
}

class _ListItemHorizontalState extends State<ListItemHorizontal> {
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
      height: 240,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          list.length,
          (int index) {
            Map<String, dynamic> product = list[index];
            return PostCardHorizontal(
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
