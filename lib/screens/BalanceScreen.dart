

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_calculator_app/model/DataManager.dart';
import 'package:water_calculator_app/res/Styles.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'package:water_calculator_app/widgets/Background.dart';
import 'package:water_calculator_app/widgets/MyCard.dart';

class BalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          BackGround(),
          BalanceCard()
        ],)
    );
  }
}

class BalanceCard extends StatefulWidget {
  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double calculateWidth(){
    if (MediaQuery.of(context).size.width > 600)
      if (MediaQuery.of(context).orientation == Orientation.landscape)
        return MediaQuery.of(context).size.width/2;
      else return MediaQuery.of(context).size.width*0.8;
    else return 400;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 120, bottom: 32, left: 8, right: 8),
      child: Center(
        child: Container(width: calculateWidth(),
        child: MyCard(
            Padding(padding: EdgeInsets.only(top: 24, bottom: 16, left: 16, right: 24),
              child: Center(
                child: Consumer<DataManager>(builder: (context, data, child) =>
                    chooseView(data, context),),
              ),
            ))
          ),
      ),
    );
  }
//Consumer<DataManager>(builder: (context, data, child) => chooseView()
  Widget chooseView(DataManager data, BuildContext context){
    String textFill =
        '${Lang.of(context).pleaseFill}\n\n\n\n'
        ' ${(data.waterNeeded == 0)? Lang.of(context).waterCalculator :''}'
        ' ${(data.waterNeeded == 0 && data.foodWater == 0)? '\n\n${Lang.of(context).and}\n\n' :''}'
        ' ${(data.foodWater == 0)? Lang.of(context).foodCalculator :''}'
        ;


    /*'${(data.foodWater == 0 && data.foodWater == 0)? '\n\n ${Lang.of(context).and} '
        '\n\n${Lang.of(context).foodCalculator}' : ''}'*/

    if (data.waterNeeded == 0 || data.foodWater == 0) return Container(
      child: Text(textFill, style: Styles.TextMain,  textAlign: TextAlign.center, ),
    );
    else {
      double diff = data.foodWater * 0.001 - data.waterNeeded;
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Container(width: double.infinity, child:
        Text('${Lang.of(context).dailyWater}'
            '\n${data.waterNeeded.toStringAsFixed(1)}'
            ', ${Lang.of(context).l}',
          style: Styles.TextMain, textAlign: TextAlign.center,),
            ),

        SizedBox(height: 20,),

        Text('${Lang.of(context).waterInFood} \n'
            '${(data.foodWater * 0.001).toStringAsFixed(1)} '
            '${Lang.of(context).l}',
          textAlign: TextAlign.center, style: Styles.TextMain,),

        SizedBox(height: 20,),

        RichText(textAlign: TextAlign.center, text: TextSpan(style: Styles.TextMain, children: [
          TextSpan(text: '${Lang.of(context).youDrink} '),
          TextSpan(text: '${(diff > 0.2 || diff < -0.2)? Lang.of(context).on :''} '),
          TextSpan(style: TextStyle(fontSize: 28, color: (diff > 0)? Colors.green : Colors.red),
              text: '${(diff > 0.2 || diff < -0.2)? '${diff.abs().toStringAsFixed(1)} ${Lang.of(context).l} ':''}'
              ),
          TextSpan(text: '${(diff <= 0.2 && diff >= -0.2)? Lang.of(context).idealAmount : ''}'),
          TextSpan(text: '${(diff > 0.2 )? Lang.of(context).moreThanNeed : ''}'),
          TextSpan(text: '${(diff < -0.2 )? Lang.of(context).lessThanNeed : ''}'),
        ]),)
      ],);
    }
  }
}

