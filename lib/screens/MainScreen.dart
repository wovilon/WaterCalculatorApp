
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/ResColor.dart';
import 'package:water_calculator_app/res/Styles.dart';

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
      return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [MenuButton(), MenuButton(), MenuButton()],));
    else return Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [MenuButton(), MenuButton(), MenuButton()],));
  }
}

class MenuButton extends StatefulWidget{
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
    return Card(elevation: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(padding: EdgeInsets.all(32),
          child: Text('Water ${isPortrait? '' : '\n'} calculator',
            style: Styles.TextMain,
            textAlign: TextAlign.center,)
    ),);
  }
}

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(color: ResColor.BackGround,);
  }
}

