import 'package:church_app/widgets/like_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/config.controller.dart';

class SkeletonCardVertical extends StatelessWidget {
  const SkeletonCardVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16.0,
      ),
      padding: const EdgeInsets.all(
        6.0,
      ),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(
          color: Config.colors[ColorVariables.borderGray]!,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                24.0,
              ),
            ),
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.circular(
                  16.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
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
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: LikeButton(
                        onPressLike: () {},
                        liked: false,
                        size: LikeButtonSize.small,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 4),
                      height: 16,
                      width: 160,
                      child: const SkeletonLine(),
                    ),
                    Container(
                      height: 16,
                      width: 160,
                      margin: const EdgeInsets.only(top: 4),
                      child: const SkeletonLine(),
                    ),
                    Container(
                      height: 16,
                      width: 160,
                      margin: const EdgeInsets.only(top: 4),
                      child: const SkeletonLine(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
