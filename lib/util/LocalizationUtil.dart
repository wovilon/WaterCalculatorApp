import 'package:flutter/material.dart';


class Lang {
  Lang(this.locale);

  final Locale locale;

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'waterCalculator' : 'WATER CALCULATOR',
      'foodCalculator' : 'FOOD CALCULATOR',
      'yourBalance' : 'YOUR WATER BALANCE',
    },
    'ru': {
      'title': 'Привет мир!',
      'waterCalculator' : 'КАЛЬКУЛЯТОР ПОТРЕБНОСТИ В ВОДЕ',
      'foodCalculator' : 'КАЛЬКУЛЯТОР ВОДЫ В ПИЩЕ',
      'yourBalance' : 'ВАШ ВОДНЫЙ БАЛАНС',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];}
  String get waterCalculator {
    return _localizedValues[locale.languageCode]['waterCalculator'];}
  String get foodCalculator {
    return _localizedValues[locale.languageCode]['foodCalculator'];}
  String get yourBalance {
    return _localizedValues[locale.languageCode]['yourBalance'];}
}

