import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:water_calculator_app/screens/FoodScreen.dart';
import 'package:water_calculator_app/screens/MainScreen.dart';
import 'package:water_calculator_app/screens/WaterScreen.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'util/DemoLocalizationDelegate.dart';
import 'util/Routes.dart';






class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? Text('long')
          : Text('loooooooooooooooooooooooooooong'),
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
      debugShowCheckedModeBanner: false,
      locale: Locale('en', ''),
      onGenerateTitle: (BuildContext context) => Lang.of(context).title,
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ru', ''),
      ],

      routes: {
        Routes.mainScreen:(BuildContext context) => MainScreen(),
        Routes.waterScreen:(BuildContext context) => WaterScreen(),
        Routes.foodScreen:(BuildContext context) => FoodScreen()
      },
      home: MainScreen()
    );
  }
}

void main() {
  runApp(MyApp());
}