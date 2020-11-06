
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/ResColor.dart';

class Styles{
  static const TextMain = TextStyle(
    fontSize: 20,
    fontFamily: 'Pribambas',
    letterSpacing: 2.0,
    color: Colors.black87,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.grey,
        offset: Offset(5.0, 5.0),
      ),
    ],
  );

  static const TextSecondary = TextStyle(
    fontSize: 14,
    fontFamily: 'Pribambas',
    letterSpacing: 1.0,
    color: Colors.black87,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.grey,
        offset: Offset(5.0, 5.0),
      ),
    ],
  );

  static const TextTetriaryGrey = TextStyle(
    fontSize: 14,
    color: ResColor.TextGrey
  );
  static const TextTetriaryBlack = TextStyle(
      fontSize: 14,
      color: Colors.black
  );
}