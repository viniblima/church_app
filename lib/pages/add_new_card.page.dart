import 'package:church_app/controllers/payment.controller.dart';
import 'package:church_app/models/credit_card.model.dart';
import 'package:church_app/widgets/button.widget.dart';
import 'package:church_app/widgets/masked_input.widget.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../controllers/config.controller.dart';
import '../widgets/credit_card.widget.dart';

import 'package:church_app/utils/credit_card_detector.util.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({Key? key}) : super(key: key);

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  final TextEditingController numCardController = TextEditingController();
  final MaskTextInputFormatter numCardmask =
      MaskTextInputFormatter(mask: "#### #### #### ####");

  final TextEditingController expirationController = TextEditingController();
  final MaskTextInputFormatter expirationCardMask = MaskTextInputFormatter(
    mask: "SA/####",
    filter: {
      "S": RegExp('[0-1]'),
      "A": RegExp('[012]'),
      "#": RegExp('[0-9]'),
    },
  );

  final TextEditingController cvvController = TextEditingController();
  final MaskTextInputFormatter cvvCardMask =
      MaskTextInputFormatter(mask: "###");

  final TextEditingController nameController = TextEditingController();
  final MaskTextInputFormatter nameCardMask = MaskTextInputFormatter(mask: "");

  PaymentControllerX paymentControllerX = Get.find<PaymentControllerX>();

  final FlipCardController flipCardController = FlipCardController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
/* 
    Map<BrandCreditCard, String> brand = {
      BrandCreditCard.mastercard: 'mastercard',
      BrandCreditCard.amex: 'american_express',
      BrandCreditCard.visa: 'visa',
    }; */

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: Config.colors[ColorVariables.primary],
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Config.colors[ColorVariables.white],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            36,
                          ),
                          topRight: Radius.circular(
                            36,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Positioned(
                      top: 120,
                      left: (MediaQuery.of(context).size.width -
                              (MediaQuery.of(context).size.width - 80)) /
                          2,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        height: 160,
                        child: CreditCardAnimated(
                          hideNumbersCard: false,
                          card: paymentControllerX.newCard.value,
                          controller: flipCardController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 16,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    MaskedInput(
                      label: 'card_number'.tr,
                      onChanged: (String value) {
                        paymentControllerX.newCard.value.numberCard =
                            numCardmask.getMaskedText();

                        paymentControllerX.newCard.value.brand = detectCCType(
                            paymentControllerX.newCard.value.numberCard);

                        setState(
                          () {
                            numCardController.value = numCardmask.updateMask(
                              mask: "#### #### #### ####",
                            );
                          },
                        );
                      },
                      formatter: numCardmask,
                      textController: numCardController,
                      textInputType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.length < 19) {
                          return 'invalid_number'.tr;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: MaskedInput(
                            label: 'expiration_date'.tr,
                            onChanged: (String value) {
                              if (value.isEmpty) {
                                paymentControllerX
                                    .newCard.value.expirationMonth = '00';
                              } else {
                                if (value.split('/').first.length == 1) {
                                  paymentControllerX
                                          .newCard.value.expirationMonth =
                                      '${value.split('/').first}0';
                                } else {
                                  paymentControllerX.newCard.value
                                      .expirationMonth = value.split('/').first;
                                }
                              }

                              if (value.contains('/')) {
                                Map<int, String> obj = {
                                  1: '${value.split('/').last}000',
                                  2: '${value.split('/').last}00',
                                  3: '${value.split('/').last}0',
                                  4: value.split('/').last
                                };
                                paymentControllerX
                                        .newCard.value.expirationYear =
                                    obj[value.split('/').last.length] ?? '0000';
                              } else {
                                paymentControllerX
                                    .newCard.value.expirationYear = '0000';
                              }

                              if (value.split('').isNotEmpty) {
                                setState(
                                  () {
                                    expirationController.value =
                                        expirationCardMask.updateMask(
                                      mask: "SA/####",
                                      filter: {
                                        "S": RegExp('[0-1]'),
                                        "A": value.split('')[0] == '0'
                                            ? RegExp('[1-9]')
                                            : RegExp('[012]'),
                                        "#": RegExp('[0-9]'),
                                      },
                                    );
                                  },
                                );
                              } else {
                                setState(
                                  () {
                                    expirationController.value =
                                        expirationCardMask.updateMask(
                                      mask: "SA/####",
                                      filter: {
                                        "S": RegExp('[0-1]'),
                                        "A": RegExp('[012]'),
                                        "#": RegExp('[0-9]'),
                                      },
                                    );
                                  },
                                );
                              }
                            },
                            formatter: expirationCardMask,
                            textController: expirationController,
                            textInputType: TextInputType.number,
                            validator: (String? value) {
                              if (value!.length < 7) {
                                return 'invalid_date'.tr;
                              }
                              String year = value.split('/').last;
                              String month = value.split('/').first;
                              if (DateTime(
                                      int.parse(year), int.parse(month) + 1, 0)
                                  .isBefore(DateTime.now())) {
                                return 'old_date'.tr;
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: MaskedInput(
                            label: 'CVV',
                            onChanged: (String value) {
                              paymentControllerX.newCard.value.cvv = value;
                              setState(() {
                                cvvController.value = cvvCardMask.updateMask(
                                  mask: "###",
                                );
                              });
                            },
                            onFocus: (bool value) {
                              if (!value) {
                                flipCardController.controller!.reverse();
                              } else {
                                flipCardController.controller!.forward();
                              }
                              //flipCardController.toggleCard();
                            },
                            validator: (String? value) {
                              if (value!.length < 3) {
                                return 'invalid_cvv'.tr;
                              }
                            },
                            formatter: cvvCardMask,
                            textController: cvvController,
                            textInputType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    MaskedInput(
                      label: 'name_on_card'.tr,
                      onChanged: (String value) {
                        paymentControllerX.newCard.value.name =
                            value.toUpperCase();
                        setState(() {
                          nameController.text.toUpperCase();
                          nameController.value = nameCardMask.updateMask(
                            mask: "SSSSSSSSSSSSSSSSSSSSSSSSS",
                            filter: {
                              "S": RegExp('[A-Z ]'),
                            },
                          );
                        });
                      },
                      formatter: nameCardMask,
                      textController: nameController,
                      textInputType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.length < 6) {
                          return 'invalid_name'.tr;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          height: 80,
          child: Center(
            child: Button(
              onPress: () {
                if (_formKey.currentState!.validate()) {
                  paymentControllerX.addCard(paymentControllerX.newCard.value);
                  //Get.offAndToNamed('payment_methods');
                  Get.back();
                }
              },
              child: Center(
                child: Text(
                  'add_card'.tr,
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
