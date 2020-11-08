
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:water_calculator_app/model/DataManager.dart';
import 'package:water_calculator_app/screens/BalanceScreen.dart';
import 'package:water_calculator_app/screens/FoodScreen.dart';
import 'package:water_calculator_app/screens/MainScreen.dart';
import 'package:water_calculator_app/screens/WaterScreen.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'util/DemoLocalizationDelegate.dart';
import 'util/Routes.dart';
import 'package:device_preview/device_preview.dart';





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
        locale: DevicePreview.of(context).locale, //device preview lib
        builder: DevicePreview.appBuilder,  //device preview lib
      //locale: Locale('en', ''),
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
        Routes.foodScreen:(BuildContext context) => FoodScreen(),
        Routes.balanceScreen:(BuildContext context) => BalanceScreen()
      },
      home: MainScreen()
    );
  }
}

void main() => runApp(
  DevicePreview(
    enabled: false,   //!kReleaseMode,
    builder: (context) =>
        ChangeNotifierProvider(
            create: (context) => DataManager(),
            child: MyApp(),
        )
  ),
);