import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
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

  double calculateWidth(){
    if (MediaQuery.of(context).size.width > 600)
      return MediaQuery.of(context).size.width/2;
    else return 400;
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topCenter,
      child: Padding(padding: EdgeInsets.only(top: 120, bottom: 32, left: 8, right: 8),
        child: Container(width: calculateWidth(),
          child: MyCard(
            Padding(padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
              child: Column(children: [
                Text(Lang.of(context).waterCalculator,
                  style: Styles.TextMain, textAlign: TextAlign.center,),
                Expanded(
                  child: Container(
                    child: ListView(children: [
                      _Item(Lang.of(context).gender,
                        yesText: Lang.of(context).male,
                        noText: Lang.of(context).female,),
                      _Item(Lang.of(context).weight, sliderValue: 20,
                          sliderUnits: Lang.of(context).kg,
                          sliderMax: 140, sliderMin: 20, sliderInterval: 20,
                          subIntervalEnabled: true,),
                      SizedBox(height: 20,),
                      _Item(Lang.of(context).physical_activity, sliderValue: 0,
                        sliderUnits: Lang.of(context).h,
                        sliderMax: 6, sliderMin: 0, sliderInterval: 1,),
                    ],),
                  ),
                )
              ],),
            ),
          ),
        )
        ),
      );
  }
}


class _Item extends StatefulWidget {
  final String caption;
  final String yesText;
  final String noText;
  bool _isSwitched = false;

  final String sliderUnits;
  double sliderValue;
  final double sliderMax;
  final double sliderMin;
  final double sliderInterval;
  final bool subIntervalEnabled;

  _Item(this.caption, {
    this.yesText = '', this.noText = '',
    this.sliderUnits = '', this.sliderValue = -1, this.sliderMax = -1, this.sliderMin = -1,
    this.sliderInterval = 0, this.subIntervalEnabled = false
  });

  @override
  State<StatefulWidget> createState() {
    return _ItemState();
  }
}

class _ItemState extends State<_Item> {


  @override
  Widget build(BuildContext context) {
    return Container(child:
    Column(children: [

      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('${widget.caption} ${widget.sliderValue==-1
            ? '' : widget.sliderValue.round().toString() + ' ' + widget.sliderUnits}',
          style: Styles.TextSecondary,),
        (widget.yesText == '' || widget.noText == '')
          ? Container()
          : Container(
          child: Row(
            children: [
              Text(widget.yesText, style:
                widget._isSwitched? Styles.TextTetriaryGrey : Styles.TextTetriaryBlack,),
              Switch(value: widget._isSwitched, onChanged: (value) {setState(() {
                widget._isSwitched = value;
              });
              },),
              Text(widget.noText, style:
                widget._isSwitched? Styles.TextTetriaryBlack : Styles.TextTetriaryGrey,)
            ],
          ),
        )
      ],),

        (widget.sliderValue == -1) ? Container() : Container(child:
        SfSlider(
          min: widget.sliderMin,
          max: widget.sliderMax,
          interval: widget.sliderInterval,
          showTicks: true,
          showLabels: true,
          minorTicksPerInterval: widget.subIntervalEnabled? 1 : 0,
          value: widget.sliderValue,
          onChanged: (value) {
            setState(() {
              widget.sliderValue = value.round().toDouble();
            });
          },
        ),

        )
    ],
    )
    );
  }
}


