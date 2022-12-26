import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';

import '../models/post.model.dart';
import 'rate_badge.widget.dart';

class PostCardVertical extends StatelessWidget {
  final Post post;
  final Function onPressLike;
  const PostCardVertical({
    required this.post,
    required this.onPressLike,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: TextButton(
        onPressed: () {},
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              child: FadeInImage(
                height: 140,
                width: 140,
                fit: BoxFit.cover,
                imageErrorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
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
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RateBadge(
                  rate: post.rate,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    post.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Config.colors[ColorVariables.black]!,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    post.category.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Config.colors[ColorVariables.black]!,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
