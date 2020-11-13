import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_calculator_app/model/DataManager.dart';
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

class CaptionFood extends StatefulWidget {
  @override
  _CaptionFoodState createState() => _CaptionFoodState();
}

class _CaptionFoodState extends State<CaptionFood> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    offset = Tween<Offset>(begin: Offset(0.0, -3.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return SlideTransition(
      position: offset,
      child: Padding(padding: EdgeInsets.only(top: 70),
        child: Center(
          child: MyCard(Padding(padding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
            child: Consumer<DataManager>(builder: (context, data, child) =>
                Text('${Lang.of(context).waterInFood} \n'
                    '${(data.foodWater * 0.001).toStringAsFixed(1)} '
                    '${Lang.of(context).litersWater}',
                  textAlign: TextAlign.center, style: Styles.TextMain,),)
          )),
        ),
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
          Section(Meals.breakfast),
          Section(Meals.lunch),
          Section(Meals.dinner),
          Section(Meals.snack1),
          Section(Meals.snack2),
          Section(Meals.snack3),
          ],),
      ),
      );

    else return Expanded(child: ListView(padding: EdgeInsets.all(16),
      children: [
        Row(children: [
          Flexible(child: Section(Meals.breakfast)),
          Flexible(child: Section(Meals.lunch)),
          Flexible(child: Section(Meals.dinner)),
        ],),
        Row(children: [
          Flexible(child: Section(Meals.snack1)),
          Flexible(child: Section(Meals.snack2)),
          Flexible(child: Section(Meals.snack3)),
        ],),
      ],),
    );
  }
}

class Section extends StatefulWidget {
  final int mealType;
  Section(this.mealType);

  @override
  _SectionState createState() => _SectionState();
}


class _SectionState extends State<Section> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    offset = Tween<Offset>(begin: Offset(0.0, 5.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));

  }


  String getMealRes(BuildContext context){
    if (widget.mealType == Meals.breakfast) return Lang.of(context).breakfast;
    else if (widget.mealType == Meals.lunch) return Lang.of(context).lunch;
    else if (widget.mealType == Meals.dinner) return Lang.of(context).dinner;
    else if (widget.mealType == Meals.snack1) return Lang.of(context).snack;
    else if (widget.mealType == Meals.snack2) return Lang.of(context).snack;
    else return Lang.of(context).snack;
  }

  @override
  Widget build(BuildContext context) {
    setAnimationTiming(widget.mealType);
    return SlideTransition(
      position: offset,
      child: Container(
        child: MyCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          ClipRRect(borderRadius:
          BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.asset(MealImages[widget.mealType])),
          Align(alignment: Alignment.bottomCenter, child:
            Container(width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white54,
                    border: Border(top: BorderSide(color: Colors.grey, width: 2
                ))),
                child: Text(getMealRes(context), style: Styles.TextMain,)
                ,)
            )
        ],
        ),
        Padding(padding: EdgeInsets.only(left: 16),
          child: Column(children: [
            DropDishes(widget.mealType, 0),
            DropDishes(widget.mealType, 1),
            DropDishes(widget.mealType, 2),
            DropDishes(widget.mealType, 3),
            DropDishes(widget.mealType, 4),
            SizedBox(height: 8,)

          ],),
        )
      ],
      )),
      ),
    );
  }

  Future<void> setAnimationTiming(int mealType)async{
    int timing = 0;
    if (mealType == Meals.breakfast) timing = 0;
    else if (mealType == Meals.lunch) timing = 600;
    else if (mealType == Meals.dinner) timing = 800;
    else if (mealType == Meals.snack1) timing = 0;
    else if (mealType == Meals.snack2) timing = 600;
    else if (mealType == Meals.snack3) timing = 800;

    await Future.delayed(Duration(milliseconds: timing));
    controller.forward();
  }
}

class DropDishes extends StatefulWidget {
  final int mealType;
  final dishNumber;

  DropDishes(this.mealType, this.dishNumber);

  @override
  _DropDishesState createState() => _DropDishesState();
}

class _DropDishesState extends State<DropDishes> {
  int item = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataManager>(builder: (context, data, child) =>
        Row(children: [
          DropdownButton(value: data.food.meals[widget.mealType].dishes[widget.dishNumber].name,
              onChanged: (value) {setState(() {
                item = value;
                data.food.meals[widget.mealType]
                    .dishes[widget.dishNumber].name = value;
                data.calculateFood();
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
          SizedBox(width: 10,),
          GestureDetector(child: Text(" - ", style: Styles.TextMainNum,),
            onTap: (){setState(() {
              if (data.food.meals[widget.mealType].dishes[widget.dishNumber].amount > 0) {
                data.food.meals[widget.mealType].dishes[widget.dishNumber].amount -= 100;
                data.calculateFood();
              }
            });},),
          Text('${data.food.meals[widget.mealType].dishes[widget.dishNumber].amount} '
              '${Lang.of(context).g}', style: Styles.TextMain,),
          GestureDetector(child: Text(" +", style: Styles.TextMainNum,),
            onTap: (){setState(() {
              data.food.meals[widget.mealType].dishes[widget.dishNumber].amount += 100;
              data.calculateFood();
            });},),
        ],)
    );
  }
}
