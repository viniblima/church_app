import 'dart:convert';

import 'package:church_app/controllers/cart.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';

import 'utils/routes.dart';
import 'utils/translations.util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    String jsonString =
        await rootBundle.loadString('main_config/application.json');
    Map<String, dynamic> config = json.decode(jsonString);
    if (kDebugMode) {
      print(config);
    }
    // ignore: empty_catches
  } catch (e) {}

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CartControllerX cartControllerX =
      Get.put<CartControllerX>(CartControllerX());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/splash',
      defaultTransition: Transition.native,
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      theme: ThemeData(
        fontFamily: 'MuseoModerno',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          actionsIconTheme: IconThemeData(
            color: Colors.black,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontSize: 10,
          ),
          button: TextStyle(
            fontSize: 10,
            color: Colors.white,
            height: 1.5,
          ),
          labelMedium: TextStyle(
            fontSize: 10,
            color: Colors.white,
          ),
        ),
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
      ),
      getPages: routes,
    );
  }
}
