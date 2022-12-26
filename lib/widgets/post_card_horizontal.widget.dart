import 'package:church_app/models/product.model.dart';
import 'package:church_app/widgets/like_button.widget.dart';
import 'package:church_app/widgets/rate_badge.widget.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';

class PostCardHorizontal extends StatelessWidget {
  final Product product;
  final Function onPressLike;
  const PostCardHorizontal({
    required this.product,
    required this.onPressLike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      16.0,
                    ),
                    child: FadeInImage(
                      height: 140,
                      width: 140,
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
                Positioned(
                  right: 4,
                  top: 4,
                  child: RateBadge(
                    rate: product.rate,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              product.category.name,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.centerRight,
            child: LikeButton(
              onPressLike: onPressLike,
              liked: product.liked,
            ),
          ),
        ],
      ),
    );
  }
}
