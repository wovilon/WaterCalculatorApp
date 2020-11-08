
class Meal{
  final String image;
  final int name;
  Dish dish1 = Dish();
  Dish dish2 = Dish();
  Dish dish3 = Dish();
  Dish dish4 = Dish();
  Dish dish5 = Dish();

  Meal(this.name, this.image);

}

class Dish{
  int name = 0;
  double amount = 0;
}