import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/modal_new_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewList extends StatelessWidget {
  const AddNewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: 400,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                12.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Config.colors[ColorVariables.highlightGray]!,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
              color: Config.colors[ColorVariables.white]!,
            ),
            child: RawMaterialButton(
              onPressed: () => Get.bottomSheet(
                const ModalNewList(),
                isDismissible: true,
              ),
              child: Container(
                height: 400,
                width: 240,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 4,
                    color: Config.colors[ColorVariables.black]!,
                  ),
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'add_new_list'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Config.colors[ColorVariables.primary],
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: Config.colors[ColorVariables.primary],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
