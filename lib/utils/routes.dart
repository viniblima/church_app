import 'package:church_app/pages/cart.page.dart';
import 'package:church_app/pages/detail_product.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/splash.page.dart';

List<GetPage<Widget>> routes = [
  GetPage(
    name: '/splash',
    page: () => const SplashPage(),
  ),
  GetPage(
    name: '/initial_tabs',
    page: () => const SplashPage(),
  ),
  GetPage(
    name: '/detail_product',
    page: () => const DetailProductPage(),
  ),
  GetPage(
    name: '/cart',
    page: () => const CartPage(),
  )
];
