
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Menu()
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
    return Container(
      constraints: BoxConstraints(maxWidth: 200),
      child: Card(child: Container(padding: EdgeInsets.all(32),
            child: Text('text')
      ),),
    );
  }
}
