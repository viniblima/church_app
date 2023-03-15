import 'package:church_app/widgets/custom_lists.widget.dart';
import 'package:church_app/widgets/empty_unlogged.widget.dart';
import 'package:church_app/widgets/liked_products.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../controllers/login.controller.dart';
import '../controllers/user.controller.dart';
import '../providers/favorite.provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final UserControllerX userControllerX = Get.find<UserControllerX>();
  final FavoriteProvider favoriteProvider = FavoriteProvider();

  final LoginControllerX loginControllerX = Get.find<LoginControllerX>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors[ColorVariables.white],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: !loginControllerX.logged.value
            ? EmptyUnlogged(
                onPressButton: () async {
                  await favoriteProvider.getMyLists();
                  await favoriteProvider.getLikedProducts();
                },
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  CustomLists(),
                  SizedBox(
                    height: 32,
                  ),
                  Divider(),
                  LikedProducts(),
                ],
              ),
      ),
    );
  }
}
