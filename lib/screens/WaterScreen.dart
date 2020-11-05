import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/res/Styles.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'package:water_calculator_app/widgets/Background.dart';
import 'package:water_calculator_app/widgets/MyCard.dart';


class WaterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          BackGround(),
          _WaterList()
        ],)
    );
  }
}

class _WaterList extends StatefulWidget {

  @override
  __WaterListState createState() => __WaterListState();
}

class __WaterListState extends State<_WaterList> {


  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topCenter,
      child: Padding(padding: EdgeInsets.only(top: 120),
        child: MyCard(
          Column(children: [
            Text(Lang.of(context).waterCalculator, style: Styles.TextMain,),
            Container(height: 400,
              child: ListView(children: [
                _Item(),
                _Item()
              ],),
            )
          ],),
        )
        ),
      );
  }
}


class _Item extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (() {
        if (2>1) return Text('one');
        else return Text('two');
      }()),
    );
  }
}
