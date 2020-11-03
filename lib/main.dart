import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'util/DemoLocalizationDelegate.dart';






class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Lang.of(context).title),
      ),
      body: Center(
        child: Text(Lang.of(context).title),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('en', ''),
      onGenerateTitle: (BuildContext context) => Lang.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      home: DemoApp()
    );
  }
}

void main() {
  runApp(MyApp());
}