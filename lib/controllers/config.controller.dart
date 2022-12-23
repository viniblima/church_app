import 'package:church_app/pages/events.page.dart';
import 'package:church_app/pages/home.page.dart';
import 'package:church_app/pages/my_account.page.dart';
import 'package:church_app/pages/posts.page.dart';
import 'package:flutter/material.dart';

class Config {
  static Map<String, Widget> pages = const {
    'home': HomePage(),
    'posts': PostsPage(),
    'events': EventsPage(),
    'my_account': MyAccountPage(),
  };

  static Map<String, IconData> icons = const {
    'home': Icons.home,
    'posts': Icons.book,
    'events': Icons.calendar_month,
    'my_account': Icons.person,
  };

  static Map<ColorVariables, Color> colors = const {
    ColorVariables.primary: Color(0xFF00512E),
    ColorVariables.secondary: Color(0xFFD29E64),
    ColorVariables.white: Color(0xFFFFFFFF),
    ColorVariables.black: Color(0xFF000000),
    ColorVariables.borderGray: Color(0xFFEEF0F3),
    ColorVariables.inputBackground: Color.fromARGB(255, 242, 243, 242),
  };
}

enum ColorVariables {
  primary,
  secondary,
  white,
  black,
  borderGray,
  inputBackground,
}
