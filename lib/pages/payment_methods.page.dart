import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/controllers/payment.controller.dart';
import 'package:church_app/models/credit_card.model.dart';
import 'package:church_app/models/payment_method.model.dart';
import 'package:church_app/widgets/credit_card.widget.dart';
import 'package:church_app/widgets/payment_method_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../controllers/cart.controller.dart';
import '../models/product.model.dart';
import '../widgets/button.widget.dart';
import '../widgets/radio_option_installment.widget.dart';

class PaymentMethodsPage extends StatefulWidget {
  const PaymentMethodsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentMethodsPage> createState() => _PaymentMethodsPageState();
}

class _PaymentMethodsPageState extends State<PaymentMethodsPage>
    with TickerProviderStateMixin {
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  Color backgroundIcon = Config.colors[ColorVariables.primary]!;
  CartControllerX cartControllerX = Get.find<CartControllerX>();
  PaymentControllerX paymentControllerX = Get.find<PaymentControllerX>();
  late TabController controller;

  int? indexRadio;

  @override
  void initState() {
    controller = TabController(
      length: paymentControllerX.cards.length + 1,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  //TODO: Implementar pagamento
  void _doSomething(RoundedLoadingButtonController controller) async {
    if (paymentControllerX.indexInstallment < 0) {
      return;
    }
    Timer(const Duration(seconds: 3), () {
      setState(() {
        backgroundIcon = Config.colors[ColorVariables.primary]!;
      });
      cartControllerX.clearCart();
      controller.success();

      Timer(const Duration(seconds: 2), () {
        Get.offAndToNamed('checkout');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;

    for (Product element in cartControllerX.products) {
      double price = element.discount != null
          ? element.discount!.priceWithDiscount
          : element.price;

      totalPrice += price;
    }

    return Scaffold(
      backgroundColor: Config.colors[ColorVariables.primary],
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
                            18,
                          ),
                          topRight: Radius.circular(
                            18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: CarouselSlider(
                        items: <Widget>[
                          GestureDetector(
                            onTap: () async {
                              paymentControllerX.newCard.value = CreditCard(
                                expirationMonth: '00',
                                expirationYear: '0000',
                                numberCard: '',
                                cvv: '',
                                name: '',
                              );

                              await Get.toNamed('/add_new_card');
                              controller = TabController(
                                length: paymentControllerX.cards.length + 1,
                                vsync: this,
                                initialIndex: 0,
                              );
                              setState(() {});
                            },
                            child: Card(
                              elevation: 4.0,
                              child: Container(
                                width: 240,
                                decoration: BoxDecoration(
                                  color: Config.colors[ColorVariables.white],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'add_new_card'.tr,
                                      style: TextStyle(
                                        color: Config
                                            .colors[ColorVariables.primary],
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color:
                                          Config.colors[ColorVariables.primary],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ...List.generate(
                            paymentControllerX.cards.length,
                            (int indexCard) {
                              CreditCard card =
                                  paymentControllerX.cards[indexCard];

                              return CreditCardAnimated(
                                card: card,
                              );
                            },
                          ),
                        ],
                        options: CarouselOptions(
                          aspectRatio: 2.8,
                          enlargeCenterPage: false,
                          viewportFraction: 0.5,
                          enableInfiniteScroll: false,
                          onPageChanged:
                              (int index, CarouselPageChangedReason reason) {
                            paymentControllerX.updateIndexInstallment(
                                value: -1);
                            controller.animateTo(index);
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 280,
              width: MediaQuery.of(context).size.width,
              color: Config.colors[ColorVariables.white],
              padding: const EdgeInsets.all(16),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('other_payment_methods'.tr),
                      Column(
                        children: List.generate(
                          Config.paymentMethods.length,
                          (int index) {
                            PaymentMethod method = PaymentMethod.fromMap(
                                Config.paymentMethods[index]);
                            return PaymentMethodItem(
                              method: method,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  ...List.generate(
                    paymentControllerX.cards.length,
                    (index) => ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        5,
                        (int index) {
                          return Obx(
                            () => RadioOptionInstallment(
                              index: index,
                              groupValue:
                                  paymentControllerX.indexInstallment.value,
                              totalPrice: totalPrice,
                              onChange: (int? value) {
                                setState(() {
                                  paymentControllerX.updateIndexInstallment(
                                      value: value!);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Config.colors[ColorVariables.white],
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Config.colors[ColorVariables.primary],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    NumberFormat.simpleCurrency(
                      locale: Get.locale.toString(),
                    ).format(
                      totalPrice,
                    ),
                    style: TextStyle(
                      color: Config.colors[ColorVariables.white],
                      decorationColor: Config.colors[ColorVariables.black],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'view_details'.tr,
                    style: TextStyle(
                      color: Config.colors[ColorVariables.white],
                      decorationColor: Config.colors[ColorVariables.black],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              /* Button(
                onPress: () {},
                type: ButtonVariables.outline,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'pay_now'.tr,
                      style: TextStyle(
                        color: Config.colors[ColorVariables.primary],
                        fontSize: 12,
                      ),
                    ),
                    Center(
                      child: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        size: 18,
                        color: Config.colors[ColorVariables.primary],
                      ),
                    ),
                  ],
                ),
              ), */
              SizedBox(
                width: 110,
                child: Obx(
                  () => paymentControllerX.indexInstallment < 0
                      ? Button(
                          onPress: () {},
                          type: ButtonVariables.outline,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'pay_now'.tr,
                                style: TextStyle(
                                  color: Config
                                      .colors[ColorVariables.highlightPrimary],
                                  fontSize: 12,
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  size: 18,
                                  color: Config
                                      .colors[ColorVariables.highlightPrimary],
                                ),
                              ),
                            ],
                          ),
                        )
                      : RoundedLoadingButton(
                          color: Config.colors[ColorVariables.white],
                          successIcon: Icons.check_circle_outline,
                          successColor: Config.colors[ColorVariables.white],
                          failedIcon: Icons.cottage,
                          controller: _btnController1,
                          valueColor: backgroundIcon,
                          onPressed: () =>
                              paymentControllerX.indexInstallment >= 0
                                  ? _doSomething(_btnController1)
                                  : () {},
                          child: Hero(
                            tag: 'pay_button',
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'pay_now'.tr,
                                  style: TextStyle(
                                    color: paymentControllerX
                                                .indexInstallment >=
                                            0
                                        ? Config.colors[ColorVariables.primary]
                                        : Config.colors[
                                            ColorVariables.highlightPrimary],
                                    fontSize: 12,
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.keyboard_arrow_right_sharp,
                                    size: 18,
                                    color: paymentControllerX
                                                .indexInstallment >=
                                            0
                                        ? Config.colors[ColorVariables.primary]
                                        : Config.colors[
                                            ColorVariables.highlightPrimary],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
