import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:water_calculator_app/model/DataManager.dart';
import 'package:water_calculator_app/model/WaterData.dart';
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
  WaterData waterData = WaterData.getInstance;

  @override
  __WaterListState createState() => __WaterListState();
}

class __WaterListState extends State<_WaterList> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  DataManager data;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    offset = Tween<Offset>(begin: Offset(0.0, 5.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

  }

  double calculateWidth(){
    if (MediaQuery.of(context).size.width > 600)
      if (MediaQuery.of(context).orientation == Orientation.landscape)
               return MediaQuery.of(context).size.width/2;
              else return MediaQuery.of(context).size.width*0.8;
    else return 400;
  }

  void setGender(bool value) {widget.waterData.genderMale = value; setState(() {});}
  void setWeight(double value) {widget.waterData.weight = value; setState(() {});}
  void setPhys(double value) {widget.waterData.physicalActivity = value; setState(() {});}
  void setCoffee(double value) {widget.waterData.coffee = value; setState(() {});}
  void setSun(bool value) {widget.waterData.sunnyClimate = value; setState(() {});}
  void setProtein(bool value) {widget.waterData.proteinDiet = value; setState(() {});}
  void setPregnancy(bool value) {widget.waterData.pregnancy = value; setState(() {});}
  void setBreastFeed(bool value) {widget.waterData.breastFeeding = value; setState(() {});}
  void setIll(bool value) {widget.waterData.ill = value; setState(() {});}

  @override
  Widget build(BuildContext context) {
    if(data == null) data = context.watch<DataManager>();
    data.calculateWater();
    controller.forward();
    return SlideTransition(
      position: offset,
      child: Align(alignment: Alignment.topCenter,
          child: Padding(padding: EdgeInsets.only(top: 120, bottom: 32, left: 8, right: 8),
            child: Container(width: calculateWidth(),
              child: MyCard(
                Padding(padding: const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 8),
                  child: Column(children: [
                    Text('${Lang.of(context).dailyWater}'
                        ' ${data.waterNeeded.toStringAsFixed(1)}'
                        ', ${Lang.of(context).l}'
                        ' ',
                      style: Styles.TextMain, textAlign: TextAlign.center,),
                    SizedBox(height: 8,),
                    Expanded(
                      child: Container(
                        child: ListView(padding: EdgeInsets.only(top: 8),
                          children: [
                          _Item(Lang.of(context).gender, onSwitch: setGender,
                            isSwitched: widget.waterData.genderMale,
                            yesText: Lang.of(context).female,
                            noText: Lang.of(context).male,),
                          _Item(Lang.of(context).weight, onSlide: setWeight,
                            sliderValue: widget.waterData.weight,
                            sliderUnits: Lang.of(context).kg,
                              sliderMax: 140, sliderMin: 20, sliderInterval: 20,
                              subIntervalEnabled: true,),
                          SizedBox(height: 20,),
                          _Item(Lang.of(context).physical_activity, onSlide: setPhys,
                            sliderValue: widget.waterData.physicalActivity,
                            sliderUnits: Lang.of(context).h,
                            sliderMax: 6, sliderMin: 0, sliderInterval: 1,),
                            SizedBox(height: 20,),
                            _Item(Lang.of(context).coffee, onSlide: setCoffee,
                              sliderValue: widget.waterData.coffee,
                              sliderUnits: Lang.of(context).cups,
                              sliderMax: 5, sliderMin: 0, sliderInterval: 1,),
                            SizedBox(height: 20,),
                            _Item(Lang.of(context).sun, onSwitch: setSun,
                                isSwitched: widget.waterData.sunnyClimate,
                                yesText: Lang.of(context).yes,
                              noText: Lang.of(context).no),
                            _Item(Lang.of(context).protein_diet, onSwitch: setProtein,
                                isSwitched: widget.waterData.proteinDiet,
                                yesText: Lang.of(context).yes,
                                noText: Lang.of(context).no),
                            _Item(Lang.of(context).pregnancy, onSwitch: setPregnancy,
                                isSwitched: widget.waterData.pregnancy,
                                yesText: Lang.of(context).yes,
                                noText: Lang.of(context).no),
                            _Item(Lang.of(context).breast_feeding, onSwitch: setBreastFeed,
                                isSwitched: widget.waterData.breastFeeding,
                                yesText: Lang.of(context).yes,
                                noText: Lang.of(context).no),
                            _Item(Lang.of(context).ill, onSwitch: setIll,
                                isSwitched: widget.waterData.ill,
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

  final ValueChanged<bool> onSwitch;
  final ValueChanged<double> onSlide;

  _Item(this.caption, {this.onSwitch, this.onSlide,
    this.isSwitched = false,
    this.yesText = '', this.noText = '',
    this.sliderUnits = '', this.sliderValue = -1, this.sliderMax = -1, this.sliderMin = -1,
    this.sliderInterval = 0, this.subIntervalEnabled = false,
    Key key}): super(key: key);


  void handleSwitch(){ onSwitch(isSwitched); }
  void handleSlide() { onSlide(sliderValue); }


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
              Switch(value: widget.isSwitched, onChanged: (value) {
                widget.isSwitched = value;
                widget.handleSwitch();
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
            widget.sliderValue = value.round().toDouble();
            widget.handleSlide();
          },
        ),

        )
    ],
    )
    );
  }
}


