
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
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ResColor.BDGrad1, ResColor.BDGrad2],
              stops: [0.8, 1]
          )),
        ),
        Container(width: double.infinity, height: 100,
          child: CustomPaint(
            painter: TopCurve(),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(width: double.infinity, height: 50,
            child: CustomPaint(painter: BottomCurve(),),),)
      ]
    );
  }
}

class TopCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.25, size.height * 1,
        size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.4,
        size.width * 1.0, size.height * 0.5);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BottomCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.5,
        size.width * 0.4, size.height * 1);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

