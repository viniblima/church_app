import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_products_horizontal.widget.dart';

class RelatedProducts extends StatefulWidget {
  const RelatedProducts({Key? key}) : super(key: key);

  @override
  State<RelatedProducts> createState() => _RelatedProductsState();
}

class _RelatedProductsState extends State<RelatedProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'related_products'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        //const ListProductsHorizontal(),
      ],
    );
  }
}
