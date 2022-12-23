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
];
