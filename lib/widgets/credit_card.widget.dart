import 'package:church_app/controllers/config.controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import '../models/credit_card.model.dart';

class CreditCardAnimated extends StatefulWidget {
  final CreditCard card;
  final bool hideNumbersCard;
  final FlipCardController? controller;
  const CreditCardAnimated({
    required this.card,
    this.hideNumbersCard = true,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<CreditCardAnimated> createState() => _CreditCardAnimatedState();
}

class _CreditCardAnimatedState extends State<CreditCardAnimated> {
  Widget back() {
    return Container(
      width: 240,
      height: 60,
      //padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: Config.colors[ColorVariables.purple],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 16,
            ),
            height: 20,
            //width: 240,
            color: Config.colors[ColorVariables.black],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            height: 20,
            //width: 240,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                          7,
                          (int indexLine) => Container(
                            height: 2.85,
                            //width: 132,
                            color: indexLine.isOdd
                                ? Config.colors[ColorVariables.white]
                                : Config.colors[ColorVariables.backgroundGray],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      color: Config.colors[ColorVariables.white],
                      /* child: const Center(
                        child: Text('* * *'),
                      ), */
                      child: widget.hideNumbersCard
                          ? const Center(
                              child: Text('* * *'),
                            )
                          : Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 6,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(
                                      widget.card.cvv.split('').length,
                                      (int indexString) {
                                    String textSection =
                                        widget.card.cvv.split('')[indexString];

                                    return Container(
                                      width: 8,
                                      child: Text(
                                        textSection,
                                        style: TextStyle(
                                          fontSize: 10,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget front() {
    Map<BrandCreditCard, String> brand = {
      BrandCreditCard.mastercard: 'mastercard',
      BrandCreditCard.amex: 'american_express',
      BrandCreditCard.visa: 'visa',
    };

    return Container(
      width: 240,
      height: 60,
      padding: EdgeInsets.symmetric(
          horizontal: widget.hideNumbersCard ? 8 : 0, vertical: 16),
      decoration: BoxDecoration(
        color: Config.colors[ColorVariables.purple],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.hideNumbersCard ? 4 : 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 24,
                  width: 24,
                  child: brand[widget.card.brand] != null
                      ? Image.asset(
                          'assets/images/${brand[widget.card.brand]}.png')
                      : null,
                ),
                Text(
                  '${widget.card.expirationMonth}/${widget.card.expirationYear}',
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          widget.hideNumbersCard
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ...List.generate(
                        widget.card.numberCard.isEmpty ? 0 : 3,
                        (int indexString) {
                          return Text(
                            '\u2022\u2022\u2022\u2022',
                            style: TextStyle(
                              color: Config.colors[ColorVariables.white],
                              fontSize: 26,
                            ),
                          );
                        },
                      ),
                      Text(
                        widget.card.numberCard.split(' ').last,
                        style: TextStyle(
                          color: Config.colors[ColorVariables.white],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              /* : Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.card.numberCard,
                    style: TextStyle(
                      color: Config.colors[ColorVariables.white],
                      fontSize: 24,
                    ),
                  ),
                ), */
              : Row(
                  children: List.generate(
                    widget.card.numberCard.split(' ').length,
                    (int indexString) {
                      String textSection =
                          widget.card.numberCard.split(' ')[indexString];

                      return Container(
                        alignment: Alignment.center,
                        width: 76,
                        child: Text(
                          textSection,
                          style: TextStyle(
                            color: Config.colors[ColorVariables.white],
                            fontSize: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.hideNumbersCard ? 4 : 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  widget.card.name.toUpperCase(),
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 10,
                  ),
                ),
                Text(
                  'Debit Card',
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: const Color(0x00000000),
      child: FlipCard(
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        speed: 700,
        controller: widget.controller,
        onFlipDone: (status) {
          print(status);
        },
        front: front(),
        back: back(),
      ),
    );
  }
}
