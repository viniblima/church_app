import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class NavigationHeroPage extends StatefulWidget {
  const NavigationHeroPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationHeroPage> createState() => _NavigationHeroPageState();
}

class _NavigationHeroPageState extends State<NavigationHeroPage> {
  late String tag;

  @override
  void initState() {
    tag = Get.parameters['hero_tag'] ?? 'login';

    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed("initial_tabs");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Hero(
          tag: '${tag}_button',
          child: Container(
            color: Config.colors[ColorVariables.primary],
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
