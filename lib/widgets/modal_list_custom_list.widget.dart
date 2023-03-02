import 'package:church_app/models/custom_list.model.dart';
import 'package:church_app/widgets/button.widget.dart';
import 'package:church_app/widgets/modal_new_list.widget.dart';
import 'package:church_app/widgets/radio_custom_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import '../controllers/favorite.controller.dart';
import '../models/product.model.dart';
import '../providers/favorite.provider.dart';

class ModalListCustomList extends StatefulWidget {
  final Product product;
  const ModalListCustomList({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  State<ModalListCustomList> createState() => _ModalListCustomListState();
}

class _ModalListCustomListState extends State<ModalListCustomList> {
  final FavoriteControllerX favoriteControllerX =
      Get.find<FavoriteControllerX>();

  final FavoriteProvider favoriteProvider = FavoriteProvider();

  @override
  void initState() {
    favoriteControllerX.updateIndexList(value: -1);
    favoriteProvider.getMyLists();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Config.colors[ColorVariables.white],
      ),
      height: 400,
      child: Column(
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              Get.back();
              Get.bottomSheet(
                ModalNewList(
                  product: widget.product,
                ),
                isDismissible: true,
              );
            },
            child: ListTile(
              title: Text('add_new_list'.tr),
              subtitle: Text("create_new_list".tr),
              contentPadding: const EdgeInsets.all(16),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
          Obx(
            () => favoriteControllerX.loadingCustomLists.value ||
                    favoriteControllerX.loadingAddProductToList.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      //physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        favoriteControllerX.customLists.length,
                        (index) {
                          CustomList list =
                              favoriteControllerX.customLists[index];

                          return RadioCustomList(
                            index: index,
                            list: list,
                            groupValue: favoriteControllerX.indexList.value,
                            onChange: (int? index) {
                              setState(() {
                                favoriteControllerX.updateIndexList(
                                  value: index!,
                                );
                              });
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ),
          Obx(
            () => favoriteControllerX.loadingCustomLists.value ||
                    favoriteControllerX.loadingAddProductToList.value
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(16),
                    child: Button(
                      disabled: favoriteControllerX.indexList < 0,
                      onPress: () async {
                        CustomList list = favoriteControllerX
                            .customLists[favoriteControllerX.indexList.value];
                        Get.back();
                        await favoriteProvider.addProductToList(
                          idList: list.id,
                          listProducts: [
                            {
                              "ID": widget.product.id,
                            }
                          ],
                        );
                      },
                      child: Center(
                        child: Text(
                          'add'.tr,
                          style: TextStyle(
                            color: Config.colors[ColorVariables.white],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
