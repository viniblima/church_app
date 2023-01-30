import 'package:church_app/controllers/favorite.controller.dart';
import 'package:church_app/widgets/favorite_list_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/custom_list.model.dart';

import 'add_new_list.widget.dart';

class CustomLists extends StatelessWidget {
  CustomLists({Key? key}) : super(key: key);

  final FavoriteControllerX favoriteControllerX =
      Get.find<FavoriteControllerX>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'my_lists'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              const AddNewList(),
              ...List.generate(
                favoriteControllerX.customLists.length,
                (int index) {
                  CustomList customList =
                      favoriteControllerX.customLists[index];
                  return FavoriteListButton(customList: customList);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
