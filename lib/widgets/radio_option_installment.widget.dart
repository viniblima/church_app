import 'package:church_app/controllers/config.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RadioOptionInstallment extends StatelessWidget {
  final int index;
  final int? groupValue;
  final double totalPrice;

  final Function(int?)? onChange;
  const RadioOptionInstallment({
    required this.index,
    required this.groupValue,
    required this.onChange,
    required this.totalPrice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Config.colors[ColorVariables.white],
      child: RadioListTile(
        value: index,
        title: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${index + 1}x',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  NumberFormat.simpleCurrency(
                    locale: Get.locale.toString(),
                  ).format(
                    totalPrice / (index + 1),
                  ),
                )
              ],
            ),
          ],
        ),
        groupValue: groupValue,
        onChanged: onChange,
      ),
    );
  }
}
