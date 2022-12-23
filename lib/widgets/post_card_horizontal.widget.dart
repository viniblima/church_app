import 'package:church_app/widgets/rate_badge.widget.dart';
import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';
import '../models/post.model.dart';

class PostCardHorizontal extends StatelessWidget {
  final Post post;
  final Function onPressLike;
  const PostCardHorizontal({
    required this.post,
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
                    rate: post.rate,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              post.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 4.0, left: 4.0),
            child: Text(
              post.category.name,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Container(
            width: 140,
            height: 50,
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => post.liked
                        ? Config.colors[ColorVariables.white]!
                        : Config.colors[ColorVariables.primary]!,
                  ),
                  backgroundColor: post.liked
                      ? MaterialStateProperty.resolveWith<Color>(
                          (states) => post.liked
                              ? Config.colors[ColorVariables.primary]!
                              : Config.colors[ColorVariables.white]!,
                        )
                      : MaterialStateProperty.resolveWith<Color>(
                          (states) => Config.colors[ColorVariables.white]!,
                        ),
                ),
                onPressed: () => onPressLike(),
                child: Center(
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: post.liked
                        ? Config.colors[ColorVariables.white]
                        : Config.colors[ColorVariables.black],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
