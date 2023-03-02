import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/config.controller.dart';

class SkeletonCustomList extends StatelessWidget {
  const SkeletonCustomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child: RawMaterialButton(
              onPressed: () {},
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Config.colors[ColorVariables.black]!,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.0,
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
            ),
          ),
        ],
      ),
    );
  }
}
