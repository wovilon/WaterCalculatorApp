
import 'package:water_calculator_app/model/Enum.dart';
import 'package:water_calculator_app/model/Meal.dart';

class Food{
  List<Meal> meals = [
    Meal(Meals.breakfast),
    Meal(Meals.lunch),
    Meal(Meals.dinner),
    Meal(Meals.snack1),
    Meal(Meals.snack2),
    Meal(Meals.snack3)
  ];

  static Food _instance;
  Food._internal();

  static get getInstance {
    if (_instance == null) {_instance = Food._internal();}
    return _instance;
  }
}
