import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/config.controller.dart';

class SekeletonPurchaseCard extends StatelessWidget {
  const SekeletonPurchaseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 150,
      width: MediaQuery.of(context).size.width,
      color: Config.colors[ColorVariables.white],
      child: const Card(
        child: SkeletonAvatar(),
      ),
    );
  }
}
