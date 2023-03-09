import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/config.controller.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Config.colors[ColorVariables.secondary],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('notifications'.tr)],
        ),
      ),
    );
  }
}
