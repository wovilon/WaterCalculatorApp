
class WaterData{
  bool genderMale = false;
  double weight = 20;
  double physicalActivity = 0;
  double coffee = 0;
  bool sunnyClimate = false;
  bool proteinDiet = false;
  bool pregnancy = false;
  bool breastFeeding = false;
  bool ill = false;

  static WaterData _instance;
  WaterData._internal();

  static get getInstance {
    if (_instance == null) {
      _instance = WaterData._internal();
    }
    return _instance;
  }
}
