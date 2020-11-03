import 'package:flutter/material.dart';

import 'LocalizationUtil.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class DemoLocalizationsDelegate extends LocalizationsDelegate<Lang> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ru'].contains(locale.languageCode);

  @override
  Future<Lang> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<Lang>(Lang(locale));
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}