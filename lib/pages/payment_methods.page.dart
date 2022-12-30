import 'package:carousel_slider/carousel_slider.dart';
import 'package:church_app/controllers/config.controller.dart';
import 'package:church_app/widgets/button.widget.dart';
import 'package:church_app/widgets/credit_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/cart.controller.dart';
import '../models/product.model.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;

    CartControllerX cartControllerX = Get.find<CartControllerX>();

    for (Product element in cartControllerX.products) {
      totalPrice += element.priceWithDiscount;
    }
    return Scaffold(
      backgroundColor: Config.colors[ColorVariables.primary],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CarouselSlider(
                        items: [
                          /* Container(
                            color: Config.colors[ColorVariables.white],
                            width: 45,
                            child: Center(
                              child: Icon(
                                Icons.add,
                              ),
                            ),
                          ), */
                          CreditCard(),
                          CreditCard(),
                          CreditCard(),
                          CreditCard(),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 0.8,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Config.colors[ColorVariables.white],
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Config.colors[ColorVariables.primary],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          height: 100,
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    NumberFormat.simpleCurrency(
                      locale: Get.locale.toString(),
                    ).format(
                      totalPrice,
                    ),
                    style: TextStyle(
                      color: Config.colors[ColorVariables.highlightGray],
                      decorationColor: Config.colors[ColorVariables.black],
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10,
                    ),
                  ),
                  Text('valor'),
                ],
              ),
              Button(
                onPress: () {},
                child: Center(
                  child: Text('pay now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
