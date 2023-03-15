import 'package:flutter/material.dart';

import '../controllers/config.controller.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethods method;
  final int? groupValue;
  final Function(int?)? onChange;

  const PaymentMethodItem({
    required this.method,
    required this.groupValue,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(16),
      color: Config.colors[ColorVariables.white],
      alignment: Alignment.centerLeft,
      // color: Colors.red,
      child: RadioListTile(
        value: Config.paymentMap[method]!["value"] as int,
        title: Row(
          children: [
            Icon(
              Config.paymentMap[method]!["icon"],
              color: Config.colors[ColorVariables.black],
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              Config.paymentMap[method]!["name"],
            ),
          ],
        ),
        groupValue: groupValue,
        onChanged: onChange,
      ),
    );
  }
}
