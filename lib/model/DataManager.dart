
import 'package:flutter/cupertino.dart';
import 'package:water_calculator_app/model/FoodData.dart';
import 'package:water_calculator_app/model/WaterData.dart';

import 'Enum.dart';

class DataManager extends ChangeNotifier{
  double waterNeeded = 0; // liters
  double foodWater = 0;   // ml or g

  Food food = Food.getInstance;


  void calculateWater(){
    WaterData data = WaterData.getInstance;

    waterNeeded = data.weight * (data.genderMale? 0.027 : 0.025)
        + data.physicalActivity * 0.27
        + data.coffee * 0.2
        + (data.sunnyClimate? 1 : 0) * (data.weight*0.005 + data.physicalActivity * 0.1)
        + (data.proteinDiet? 1: 0) * 0.7
        + (data.breastFeeding? 1: 0) * (data.weight * 0.01 + data.physicalActivity * 0.3)
        + (data.ill? 1 : 0) * 0.9;
    //notifyListeners();
  }

  void calculateFood(){
    foodWater = 0;

    for (var meal in food.meals){
      for (var dish in meal.dishes){
        if (dish.name != Dishes.none)
          foodWater += (dish.amount * WaterContents[dish.name]);
      }
    }
    notifyListeners();
  }
}