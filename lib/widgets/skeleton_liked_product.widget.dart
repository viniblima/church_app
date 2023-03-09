import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonLikedProuct extends StatelessWidget {
  const SkeletonLikedProuct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            SizedBox(
              child: SkeletonAvatar(),
            ),
          ],
        ));
  }
}
