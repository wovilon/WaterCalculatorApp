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
      if (MediaQuery.of(context).orientation == Orientation.landscape)
               return MediaQuery.of(context).size.width/2;
              else return MediaQuery.of(context).size.width*0.8;
    else return 400;
  }
  bool state = false;
  void _handleChanges(bool newValue){
    setState(() {
      print('changes handled');
      state = newValue;
    });
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
                    child: ListView(padding: EdgeInsets.only(top: 8),
                      children: [
                      _Item(Lang.of(context).gender, _handleChanges,
                        isSwitched: state,
                        yesText: Lang.of(context).male,
                        noText: Lang.of(context).female,),
                      _Item(Lang.of(context).weight, _handleChanges, sliderValue: 20,
                        sliderUnits: Lang.of(context).kg,
                          sliderMax: 140, sliderMin: 20, sliderInterval: 20,
                          subIntervalEnabled: true,),
                      SizedBox(height: 20,),
                      _Item(Lang.of(context).physical_activity, _handleChanges, sliderValue: 0,
                        sliderUnits: Lang.of(context).h,
                        sliderMax: 6, sliderMin: 0, sliderInterval: 1,),
                        SizedBox(height: 20,),
                        _Item(Lang.of(context).coffee, _handleChanges, sliderValue: 0,
                          sliderUnits: Lang.of(context).cups,
                          sliderMax: 5, sliderMin: 0, sliderInterval: 1,),
                        SizedBox(height: 20,),
                        _Item(Lang.of(context).sun, _handleChanges,
                            isSwitched: state,
                            yesText: Lang.of(context).yes,
                          noText: Lang.of(context).no),
                        _Item(Lang.of(context).protein_diet, _handleChanges,
                            isSwitched: state,
                            yesText: Lang.of(context).yes,
                            noText: Lang.of(context).no),
                        _Item(Lang.of(context).pregnancy, _handleChanges,
                            isSwitched: state,
                            yesText: Lang.of(context).yes,
                            noText: Lang.of(context).no),
                        _Item(Lang.of(context).breast_feeding, _handleChanges,
                            isSwitched: state,
                            yesText: Lang.of(context).yes,
                            noText: Lang.of(context).no),
                        _Item(Lang.of(context).ill, _handleChanges,
                            isSwitched: state,
                            yesText: Lang.of(context).yes,
                            noText: Lang.of(context).no),
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
  bool isSwitched;

  final String sliderUnits;
  double sliderValue;
  final double sliderMax;
  final double sliderMin;
  final double sliderInterval;
  final bool subIntervalEnabled;

  final ValueChanged<bool> onChanged;

  _Item(this.caption, this.onChanged, {
    this.isSwitched = false,
    this.yesText = '', this.noText = '',
    this.sliderUnits = '', this.sliderValue = -1, this.sliderMax = -1, this.sliderMin = -1,
    this.sliderInterval = 0, this.subIntervalEnabled = false,
    Key key}): super(key: key);

  void handleChanges(){
    onChanged(isSwitched);
  }

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
                widget.isSwitched? Styles.TextTetriaryGrey : Styles.TextTetriaryBlack,),
              Switch(value: widget.isSwitched, onChanged: (value) {setState(() {
                widget.isSwitched = value;
                widget.handleChanges();
                print('inner state: $value');
              });
              },),
              Text(widget.noText, style:
                widget.isSwitched? Styles.TextTetriaryBlack : Styles.TextTetriaryGrey,)
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


