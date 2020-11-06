
import 'package:water_calculator_app/model/WaterData.dart';

class DataManager{



  double calculateWater(){
    WaterData data = WaterData.getInstance;

    return
        data.weight * (data.genderMale? 0.027 : 0.025)
        + data.physicalActivity * 0.27
        + data.coffee * 0.2
        + (data.sunnyClimate? 1 : 0) * (data.weight*0.005 + data.physicalActivity * 0.1)
        + (data.proteinDiet? 1: 0) * 0.7
        + (data.breastFeeding? 1: 0) * (data.weight * 0.01 + data.physicalActivity * 0.3)
        + (data.ill? 1 : 0) * 0.9;
  }
}