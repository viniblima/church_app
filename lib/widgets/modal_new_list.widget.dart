import 'package:church_app/providers/favorite.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';
import 'button.widget.dart';

class ModalNewList extends StatefulWidget {
  const ModalNewList({Key? key}) : super(key: key);

  @override
  State<ModalNewList> createState() => _ModalNewListState();
}

class _ModalNewListState extends State<ModalNewList> {
  bool disabled = true;
  final TextEditingController titleController = TextEditingController();
  final FavoriteProvider favoriteProvider = FavoriteProvider();

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
      height: 300,
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('title_of_list'.tr),
          const SizedBox(
            height: 32,
          ),
          TextField(
            controller: titleController,
            onChanged: (String? value) {
              setState(() {
                if (value != null) {
                  disabled = value.isEmpty;
                } else {
                  disabled = true;
                }
              });
            },
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
            height: 60,
            child: Button(
              onPress: () async {
                await favoriteProvider.addCustomList(
                    title: titleController.text);
              },
              disabled: disabled,
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
          )
        ],
      ),
    );
  }
}
