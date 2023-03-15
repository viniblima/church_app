import 'package:church_app/providers/favorite.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../models/product.model.dart';

class CardLikedProduct extends StatelessWidget {
  final Product product;
  final Function onDismiss;
  CardLikedProduct({
    required this.product,
    required this.onDismiss,
    Key? key,
  }) : super(key: key);

  final FavoriteProvider _favoriteProvider = FavoriteProvider();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (DismissDirection direction) => onDismiss(),
      key: Key("product_liked_$product.id}"),
      child: SizedBox(
        height: 120,
        child: TextButton(
          onPressed: () async {
            await Get.toNamed(
                '/detail_product/?product_id=${product.id}&origin=liked');
            await _favoriteProvider.getLikedProducts();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Config.colors[ColorVariables.borderGray]!,
                ),
              ),
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (states) => Config.colors[ColorVariables.secondary]!,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    child: Hero(
                      tag: 'tag_${product.id}_liked',
                      child: FadeInImage(
                        height: 100,
                        width: 100,
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
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Config.colors[ColorVariables.black],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
                alignment: Alignment.bottomRight,
                child: SizedBox(
                  height: 40,
                  child: TextButton(
                    child: Text(
                      "remove".tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: Config.colors[ColorVariables.secondary],
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
