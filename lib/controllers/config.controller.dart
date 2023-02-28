import 'package:church_app/pages/events.page.dart';
import 'package:church_app/pages/favorites.page.dart';
import 'package:church_app/pages/home.page.dart';
import 'package:church_app/pages/my_account.page.dart';
import 'package:church_app/pages/posts.page.dart';
import 'package:church_app/pages/products.page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  //LOCAL
  static const baseUrl = 'http://localhost:3000/api/v1';
  //PRD
  // static const baseUrl =
  //     'http://ec2-54-88-247-171.compute-1.amazonaws.com:3000/api/v1';

  static Map<String, Widget> pages = const {
    'home': HomePage(),
    'posts': PostsPage(),
    'events': EventsPage(),
    'my_account': MyAccountPage(),
    'products': ProductsPage(),
    'favorites': FavoritesPage(),
  };

  static Map<String, IconData> icons = const {
    'home': Icons.home,
    'posts': Icons.book,
    'events': Icons.calendar_month,
    'my_account': Icons.person,
    'products': Icons.production_quantity_limits_rounded,
    'favorites': Icons.favorite,
  };

  static Map<ColorVariables, Color> colors = const {
    ColorVariables.primary: Color(0xFF00512E),
    ColorVariables.secondary: Color(0xFFD29E64),
    ColorVariables.white: Color(0xFFFFFFFF),
    ColorVariables.black: Color(0xFF000000),
    ColorVariables.borderGray: Color(0xFFEEF0F3),
    ColorVariables.inputBackground: Color.fromARGB(255, 242, 243, 242),
    ColorVariables.boxShadow: Color.fromARGB(255, 227, 230, 227),
    ColorVariables.highlightGray: Color.fromARGB(255, 182, 181, 181),
    ColorVariables.backgroundGray: Color(0xFFFBFBFB),
    ColorVariables.highlightPrimary: Color(0xFF7FA896),
    ColorVariables.purple: Color(0xFF5F1584),
  };

  static List<Map<String, dynamic>> paymentMethods = [
    {
      'name': '${'credit'.tr} / ${'debit'.tr} ${'card'.tr}',
      'on_press': () {},
      'icon': Icons.credit_card,
    },
    {
      'name': 'Pix',
      'on_press': () {},
      'icon': Icons.pix,
    },
  ];
}

enum ColorVariables {
  primary,
  secondary,
  white,
  black,
  borderGray,
  inputBackground,
  highlightGray,
  backgroundGray,
  highlightPrimary,
  purple,
  boxShadow
}
