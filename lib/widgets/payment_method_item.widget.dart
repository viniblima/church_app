import 'package:church_app/models/payment_method.model.dart';
import 'package:flutter/material.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod method;
  const PaymentMethodItem({
    required this.method,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Icon(
                      method.icon,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    method.name,
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right,
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
