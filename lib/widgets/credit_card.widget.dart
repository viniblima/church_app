import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: FlipCard(
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        speed: 1000,
        onFlipDone: (status) {
          print(status);
        },
        front: Container(
          width: 160,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Center(
            child: Text(
              'Front',
            ),
          ),
        ),
        back: Container(
          width: 160,
          height: 80,
          decoration: BoxDecoration(
            color: Color(0xFF006666),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Center(
            child: Text(
              'Back',
            ),
          ),
        ),
      ),
    );
  }
}
