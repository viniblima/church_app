import 'package:church_app/controllers/favorite.controller.dart';
import 'package:church_app/providers/favorite.provider.dart';
import 'package:church_app/widgets/favorite_list_button.widget.dart';
import 'package:church_app/widgets/skeleton_custom_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/custom_list.model.dart';

import 'add_new_list.widget.dart';

class CustomLists extends StatefulWidget {
  const CustomLists({Key? key}) : super(key: key);

  @override
  State<CustomLists> createState() => _CustomListsState();
}

class _CustomListsState extends State<CustomLists> {
  final FavoriteControllerX favoriteControllerX =
      Get.find<FavoriteControllerX>();

  final FavoriteProvider favoriteProvider = FavoriteProvider();

  @override
  void initState() {
    favoriteProvider.getMyLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'my_lists'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: 400,
          child: Obx(
            () => ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                const AddNewList(),
                ...List.generate(
                  favoriteControllerX.loadingCustomLists.value
                      ? 3
                      : favoriteControllerX.customLists.length,
                  (int index) {
                    if (favoriteControllerX.loadingCustomLists.value) {
                      return const SkeletonCustomList();
                    } else {
                      CustomList customList =
                          favoriteControllerX.customLists[index];
                      return FavoriteListButton(
                        customList: customList,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
