import 'package:church_app/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Hero(
          tag: 'pay_button',
          child: Container(
            color: Config.colors[ColorVariables.primary],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${'thanks'.tr}!',
                  style: TextStyle(
                    color: Config.colors[ColorVariables.white],
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            //padding: const EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height / 2,
            color: Config.colors[ColorVariables.primary],
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                //color: Config.colors[ColorVariables.primary],
                color: Config.colors[ColorVariables.white],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Config.colors[ColorVariables.primary],
                    size: 80,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'thank_for_purchasing'.tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${'your_order_will_shipped'.tr} 4 ${'days'.tr.toLowerCase()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    height: 50,
                    child: Button(
                      onPress: () => Get.offAndToNamed('initial_tabs'),
                      child: Center(
                        child: Text(
                          'continue_shopping'.tr.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Config.colors[ColorVariables.white],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
