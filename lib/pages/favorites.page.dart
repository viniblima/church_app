import 'package:church_app/widgets/custom_lists.widget.dart';
import 'package:church_app/widgets/liked_products.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../controllers/user.controller.dart';
import '../providers/favorite.provider.dart';
import '../widgets/button.widget.dart';
import '../widgets/modal_login.widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool logged = false;
  final UserControllerX userControllerX = Get.find<UserControllerX>();
  final FavoriteProvider favoriteProvider = FavoriteProvider();

  @override
  void initState() {
    if (userControllerX.token != null) {
      getInit();
    }
    super.initState();
  }

  getInit() {
    setState(() {
      logged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors[ColorVariables.white],
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        child: !logged
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('to_view_this_area_must_be_logged'.tr),
                    SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      height: 48,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Button(
                        onPress: () async {
                          Map<String, bool>? result = await Get.bottomSheet(
                            const ModalLogin(),
                            isDismissible: true,
                          );

                          if (result == null || result["logged"] == false) {
                            return null;
                          } else {
                            setState(() {
                              logged = true;
                            });
                            await favoriteProvider.getMyLists();
                            await favoriteProvider.getLikedProducts();
                          }
                        },
                        child: Text(
                          'sign_in'.tr,
                          style: TextStyle(
                              fontSize: 16,
                              color: Config.colors[ColorVariables.white]),
                        ),
                      ),
                    ),
                  ],
                ),
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
