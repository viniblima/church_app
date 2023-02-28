import 'package:church_app/widgets/like_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/config.controller.dart';

class SkeletonCardHorizontal extends StatelessWidget {
  const SkeletonCardHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16.0,
      ),
      padding: const EdgeInsets.all(
        6.0,
      ),
      height: 140,
      width: 140,
      child: Column(
        mainAxisSize: MainAxisSize.max,
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
                    child: SizedBox(
                      height: 140,
                      width: 140,
                      child: SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          borderRadius: BorderRadius.circular(
                            16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 40,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Config.colors[ColorVariables.secondary],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.star_rate_rounded,
                          size: 14,
                          color: Config.colors[ColorVariables.white],
                        ),
                        Text(
                          '',
                          style: TextStyle(
                            fontSize: 10,
                            color: Config.colors[ColorVariables.white],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            margin: const EdgeInsets.only(top: 4.0, left: 4.0),
            height: 10,
            child: const SkeletonLine(),
          ),
          SizedBox(
            width: 135,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 4, left: 4.0),
                      height: 16,
                      width: 80,
                      child: const SkeletonLine(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4, left: 4.0),
                      height: 10,
                      width: 80,
                      child: const SkeletonLine(),
                    ),
                  ],
                ),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: LikeButton(
                    onPressLike: () {},
                    liked: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
