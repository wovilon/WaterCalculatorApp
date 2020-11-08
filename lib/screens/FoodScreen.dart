import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_calculator_app/model/Enum.dart';
import 'package:water_calculator_app/res/Styles.dart';
import 'package:water_calculator_app/util/LocalizationUtil.dart';
import 'package:water_calculator_app/widgets/Background.dart';
import 'package:water_calculator_app/widgets/MyCard.dart';


class FoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          BackGround(),
          Column(children: [CaptionFood(), FoodSection()],),
        ],)
    );
  }
}

class CaptionFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 70),
      child: Center(
        child: MyCard(Padding(padding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
          child: Text('${Lang.of(context).waterInFood} \n5.2 ${Lang.of(context).litersWater}',
              textAlign: TextAlign.center, style: Styles.TextMain,),
        )),
      ),
    );
  }
}


class FoodSection extends StatefulWidget {
  @override
  _FoodSectionState createState() => _FoodSectionState();
}

class _FoodSectionState extends State<FoodSection> {
  double itemWidth = double.infinity;
  
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).orientation == Orientation.portrait
     || MediaQuery.of(context).size.width < 800)
      return Container(child: Expanded(
        child: ListView(padding: EdgeInsets.all(16), children: [
            Section(),
            Section(),
            Section(),
            Section(),
            Section(),
            Section()
          ],),
      ),
      );

    else return Expanded(child: ListView(padding: EdgeInsets.all(16),
      children: [
        Row(children: [
          Flexible(child: Section()),
          Flexible(child: Section()),
          Flexible(child: Section()),
        ],),
        Row(children: [
          Flexible(child: Section()),
          Flexible(child: Section()),
          Flexible(child: Section()),
        ],),
      ],),
    );
  }
}

class Section extends StatelessWidget {
  final mealType;

  Section(this.mealType);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Stack(alignment: Alignment.bottomCenter, children: [
        ClipRRect(borderRadius:
        BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.asset('assets/Breakfast.jpg')),
        Align(alignment: Alignment.bottomCenter, child:
          Container(width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white54,
                  border: Border(top: BorderSide(color: Colors.grey, width: 2
              ))),
              child: Text('Dinner', style: Styles.TextMain,)
              ,)
          )
      ],
      ),
      Padding(padding: EdgeInsets.only(left: 16),
        child: Column(children: [
          DropDishes(),
          DropDishes(),
          DropDishes(),
          DropDishes(),
          DropDishes(),
          SizedBox(height: 8,)

        ],),
      )
    ],
    )),
    );
  }
}

class DropDishes extends StatefulWidget {
  @override
  _DropDishesState createState() => _DropDishesState();
}

class _DropDishesState extends State<DropDishes> {
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      DropdownButton(value: item,
          onChanged: (value) {setState(() {
            item = value;
          });},
          items: [
            DropdownMenuItem(value: Dishes.none, child: Text(Lang.of(context).addItem),),
            DropdownMenuItem(value: Dishes.vegetables, child: Text(Lang.of(context).vegetables),),
            DropdownMenuItem(value: Dishes.fruits, child: Text(Lang.of(context).fruits),),
            DropdownMenuItem(value: Dishes.soup, child: Text(Lang.of(context).soup),),
            DropdownMenuItem(value: Dishes.meat, child: Text(Lang.of(context).meat),),
            DropdownMenuItem(value: Dishes.porridgePotato, child: Text(Lang.of(context).porridgePotato),),
            DropdownMenuItem(value: Dishes.bread, child: Text(Lang.of(context).bread),),
            DropdownMenuItem(value: Dishes.drink, child: Text(Lang.of(context).drink),),
            DropdownMenuItem(value: Dishes.baking, child: Text(Lang.of(context).baking),),
            DropdownMenuItem(value: Dishes.cake, child: Text(Lang.of(context).cake),),
            DropdownMenuItem(value: Dishes.sandwich, child: Text(Lang.of(context).sandwich),),
          ]
      ),
      SizedBox(width: 20,),
      Text("- ", style: Styles.TextMainNum,),
      Text('250 g', style: Styles.TextMain,),
      Text(" +", style: Styles.TextMainNum,),
    ],);}
}
