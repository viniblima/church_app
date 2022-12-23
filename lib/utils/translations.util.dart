import 'dart:ui';
import 'package:get/get.dart';

import '../lang/en_us.dart';
import '../lang/pt_br.dart';

class TranslationService extends Translations {
  static const locale = Locale('pt', 'BR');

  static const fallbackLocale = Locale('tr', 'TR');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'pt_BR': ptBR,
      };

  static final langs = ['English', 'Português'];

  static final locales = [
    const Locale('en', 'US'),
    const Locale('pt', 'BR'),
  ];

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
