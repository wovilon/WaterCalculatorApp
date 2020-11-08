
import 'package:water_calculator_app/model/Enum.dart';
import 'package:water_calculator_app/model/Meal.dart';

class Food{
  Meal breakfast = Meal(Meals.breakfast, MealImages.breakfast);
  Meal lunch = Meal(Meals.lunch, MealImages.lunch);
  Meal dinner = Meal(Meals.dinner, MealImages.dinner);
  Meal snack1 = Meal(Meals.snack1, MealImages.snack1);
  Meal snack2 = Meal(Meals.snack2, MealImages.snack2);
  Meal snack3 = Meal(Meals.snack3, MealImages.snack3);

  static Food _instance;
  Food._internal();

  static get getInstance {
    if (_instance == null) {_instance = Food._internal();}
    return _instance;
  }
}
