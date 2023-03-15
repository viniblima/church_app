import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonLikedProuct extends StatelessWidget {
  const SkeletonLikedProuct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        child: Row(
          children: const <Widget>[
            SizedBox(
              child: SkeletonAvatar(),
            ),
          ],
        ));
  }
}
