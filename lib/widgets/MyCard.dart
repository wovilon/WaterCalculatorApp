
import 'package:flutter/material.dart';

class MyCard extends Card{
  final Widget child;
  MyCard(this.child);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: child,
      elevation: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}