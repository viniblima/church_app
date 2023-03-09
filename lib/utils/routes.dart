import 'package:church_app/pages/add_new_card.page.dart';
import 'package:church_app/pages/cart.page.dart';
import 'package:church_app/pages/checkout.page.dart';
import 'package:church_app/pages/detail_product.page.dart';
import 'package:church_app/pages/login.page.dart';
import 'package:church_app/pages/my_shopping.page.dart';
import 'package:church_app/pages/navigation_hero.page.dart';
import 'package:church_app/pages/payment_methods.page.dart';
import 'package:church_app/pages/sign_up.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../pages/initial_tabs.page.dart';
import '../pages/my_data.page.dart';
import '../pages/notifications.page.dart';
import '../pages/splash.page.dart';

List<GetPage<Widget>> routes = [
  GetPage(
    name: '/splash',
    page: () => const SplashPage(),
  ),
  GetPage(
    name: '/initial_tabs',
    page: () => const InitialTabsPage(),
  ),
  GetPage(
    name: '/detail_product',
    page: () => const DetailProductPage(),
  ),
  GetPage(
    name: '/cart',
    page: () => const CartPage(),
  ),
  GetPage(
    name: '/payment_methods',
    page: () => const PaymentMethodsPage(),
  ),
  GetPage(
    name: '/add_new_card',
    page: () => const AddNewCardPage(),
  ),
  GetPage(
    name: '/checkout',
    page: () => const CheckoutPage(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
  ),
  GetPage(
    name: '/sign_up',
    page: () => const SignUpPage(),
  ),
  GetPage(
    name: '/notifications',
    page: () => const NotificationsPage(),
  ),
  GetPage(
    name: '/my_shopping',
    page: () => const MyShoppingPage(),
  ),
  GetPage(
    name: '/my_data',
    page: () => const MyDataPage(),
  ),
  GetPage(
    name: '/navigation_hero/',
    page: () => const NavigationHeroPage(),
    transition: Transition.native,
  ),
  // GetPage(
  //   name: '/navigation_hero/:url',
  //   page: () => const NavigationHeroPage(),
  // )
];
