
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/Styles.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'package:water_calculator_app/util/Routes.dart';
import 'package:water_calculator_app/widgets/Background.dart';
import 'package:water_calculator_app/widgets/MyCard.dart';

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
                MenuButton(Lang.of(context).waterCalculator, Routes.waterScreen),
                MenuButton(Lang.of(context).foodCalculator, Routes.foodScreen),
                MenuButton(Lang.of(context).yourBalance, Routes.balanceScreen)
              ],)),
      );
    else return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(Lang.of(context).waterCalculator, Routes.waterScreen,
              width: 200.0, height: 210,),
            MenuButton(Lang.of(context).foodCalculator, Routes.foodScreen,
              width: 200.0, height: 210,),
            MenuButton(Lang.of(context).yourBalance, Routes.balanceScreen,
              width: 200.0, height: 210,)
          ],));
  }
}

class MenuButton extends StatefulWidget{
  final String text;
  double width = 0;
  double height = 0;
  final String route;
  MenuButton(this.text, this.route, {this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    return MenuButtonState();
  }
}

class MenuButtonState extends State<MenuButton>{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, widget.route);},
      child: Container(
        margin: EdgeInsets.all(6),
        width: (widget.width != 0) ? widget.width : double.infinity,
        height: widget.height,
        child: MyCard(
            Center(
              child: Container(padding: EdgeInsets.all(32),
                  child: Text(widget.text,
                    style: Styles.TextMain,
                    textAlign: TextAlign.center,)
              ),
            )
        )
      ),
    );
  }
}


