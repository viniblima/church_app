import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/init.controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    final InitControllerX initControllerX =
        Get.put<InitControllerX>(InitControllerX());
    Future.delayed(const Duration(seconds: 3), () => initControllerX.getInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              height: 40,
              width: 40,
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
