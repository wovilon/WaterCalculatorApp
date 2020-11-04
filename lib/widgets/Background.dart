
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/ResColor.dart';

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [ResColor.BDGrad1, ResColor.BDGrad2, ResColor.BDGrad2, ResColor.BDGrad3],
                stops: [0.0, 0.3, 0.8, 1]
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
        size.width * 0.5, size.height * 0.65);
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
