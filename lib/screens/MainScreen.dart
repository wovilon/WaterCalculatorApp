
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/ResColor.dart';
import 'package:water_calculator_app/res/Styles.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'package:water_calculator_app/widgets/Background.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackGround(),
        Menu()
      ],)
    );
  }
}


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait)
      return Padding(padding: EdgeInsets.all(20),
        child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MenuButton(Lang.of(context).waterCalculator),
                MenuButton(Lang.of(context).foodCalculator),
                MenuButton(Lang.of(context).yourBalance)
              ],)),
      );
    else return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(Lang.of(context).waterCalculator),
            MenuButton(Lang.of(context).foodCalculator),
            MenuButton(Lang.of(context).yourBalance)
          ],));
  }
}

class MenuButton extends StatefulWidget{
  final String text;
  MenuButton(this.text);

  @override
  State<StatefulWidget> createState() {
    return MenuButtonState();
  }
}

class MenuButtonState extends State<MenuButton>{

  @override
  Widget build(BuildContext context) {
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    print('width ' + MediaQuery.of(context).size.width.toString());
    return Container(margin: EdgeInsets.all(6),
      child: Card(elevation: 50.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(padding: EdgeInsets.all(32),
            child: Text(widget.text,
              style: Styles.TextMain,
              textAlign: TextAlign.center,)
      ),),
    );
  }
}


