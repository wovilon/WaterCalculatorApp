
class Meal{
  final int name;

  List<Dish> dishes = [
    Dish(),
    Dish(),
    Dish(),
    Dish(),
    Dish(),
  ];

  Meal(this.name);

}

class Dish{
  int name = 0;
  double amount = 0;
}