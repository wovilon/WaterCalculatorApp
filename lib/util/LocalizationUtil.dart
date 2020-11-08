import 'package:flutter/material.dart';


class Lang {
  Lang(this.locale);

  final Locale locale;

  static Lang of(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Hello World',
      'waterCalculator' : 'WATER CALCULATOR',
      'foodCalculator' : 'FOOD CALCULATOR',
      'yourBalance' : 'YOUR WATER BALANCE',

      'dailyWater' : 'Daily water necessity:',
      'l': 'L',
      'gender' : 'Gender',
      'male': 'Male',
      'female': 'Female',
      'weight': 'Weight',
      'kg': 'kg',
      'physical_activity': 'Physical activity',
      'h': 'h',
      'coffee': 'Coffee drinking:',
      'cups': 'cups',
      'yes': 'Yes',
      'no': 'No',
      'sun': 'Sunny climate?',
      'protein_diet': 'Protein diet',
      'pregnancy': 'Pregnancy?',
      'breast_feeding': 'Breast-feeding?',
      'ill': 'Are you ill now?',

      'waterInFood': 'Your daily food contains:',
      'litersWater': 'liters of water',

      'breakfast': 'Breakfast',
      'lunch': 'Lunch',
      'dinner': 'Dinner',
      'snack': 'Snack',

      'addItem': 'None',
      'vegetables': 'Vegetables / salad',
      'fruits': 'Fruits',
      'soup': 'Soup',
      'meat': 'Meat',
      'porridgePotato': 'Porridge / potato',
      'bread': 'Bread',
      'drink': 'Drink',
      'baking': 'Baking',
      'cake': 'Cake',
      'sandwich': 'Sandwich',

      'g': 'g',
    },
    'ru': {
      'title': 'Привет мир!',
      'waterCalculator' : 'КАЛЬКУЛЯТОР ПОТРЕБНОСТИ В ВОДЕ',
      'foodCalculator' : 'КАЛЬКУЛЯТОР ВОДЫ В ПИЩЕ',
      'yourBalance' : 'ВАШ ВОДНЫЙ БАЛАНС',

      'dailyWater' : 'Дневная потребость:',
      'l': 'л',
      'gender' : 'Пол',
      'male': 'Мужской',
      'female': 'Женский',
      'weight': 'Вес',
      'kg': 'кг',
      'physical_activity': 'Физическая активность',
      'h': 'ч',
      'coffee': 'Пьете ли вы кофе:',
      'cups': 'чашек',
      'yes': 'Да',
      'no': 'Нет',
      'sun': 'Солнечный климат?',
      'protein_diet': 'Протеиновая диета?',
      'pregnancy': 'Беременность?',
      'breast_feeding': 'Грудное вскармливание?',
      'ill': 'Вы болеете сейчас?',

      'waterInFood': 'В вашей пище содержится:',
      'litersWater': 'литров воды',

      'breakfast': 'Завтрак',
      'lunch': 'Обед',
      'dinner': 'Ужин',
      'snack': 'Перекус',

      'addItem': 'Ничего',
      'vegetables': 'Овощи / салат',
      'fruits': 'Фрукты',
      'soup': 'Суп',
      'meat': 'Мясо',
      'porridgePotato': 'Каша / картошка',
      'bread': 'Хлеб',
      'drink': 'Напиток',
      'baking': 'Выпечка',
      'cake': 'Пирожное',
      'sandwich': 'Бутерброд',

      'g': 'г',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];}
  String get waterCalculator {
    return _localizedValues[locale.languageCode]['waterCalculator'];}
  String get foodCalculator {
    return _localizedValues[locale.languageCode]['foodCalculator'];}
  String get yourBalance {
    return _localizedValues[locale.languageCode]['yourBalance'];}

  String get dailyWater {
    return _localizedValues[locale.languageCode]['dailyWater'];}
  String get l {
    return _localizedValues[locale.languageCode]['l'];}
  String get gender {
    return _localizedValues[locale.languageCode]['gender'];}
  String get male {
    return _localizedValues[locale.languageCode]['male'];}
  String get female {
    return _localizedValues[locale.languageCode]['female'];}
  String get weight {
    return _localizedValues[locale.languageCode]['weight'];}
  String get kg {
    return _localizedValues[locale.languageCode]['kg'];}
  String get physical_activity {
    return _localizedValues[locale.languageCode]['physical_activity'];}
  String get h {
    return _localizedValues[locale.languageCode]['h'];}
  String get coffee {
    return _localizedValues[locale.languageCode]['coffee'];}
  String get cups {
    return _localizedValues[locale.languageCode]['cups'];}
  String get yes {
    return _localizedValues[locale.languageCode]['yes'];}
  String get no {
    return _localizedValues[locale.languageCode]['no'];}
  String get sun {
    return _localizedValues[locale.languageCode]['sun'];}
  String get protein_diet {
    return _localizedValues[locale.languageCode]['protein_diet'];}
  String get pregnancy {
    return _localizedValues[locale.languageCode]['pregnancy'];}
  String get breast_feeding {
    return _localizedValues[locale.languageCode]['breast_feeding'];}
  String get ill {
    return _localizedValues[locale.languageCode]['ill'];}

  String get waterInFood {
    return _localizedValues[locale.languageCode]['waterInFood'];}
  String get litersWater {
    return _localizedValues[locale.languageCode]['litersWater'];}

  String get breakfast {
    return _localizedValues[locale.languageCode]['breakfast'];}
  String get lunch {
    return _localizedValues[locale.languageCode]['lunch'];}
  String get dinner {
    return _localizedValues[locale.languageCode]['dinner'];}
  String get snack {
    return _localizedValues[locale.languageCode]['snack'];}

  String get addItem {
    return _localizedValues[locale.languageCode]['addItem'];}
  String get vegetables {
    return _localizedValues[locale.languageCode]['vegetables'];}
  String get fruits {
    return _localizedValues[locale.languageCode]['fruits'];}
  String get soup {
    return _localizedValues[locale.languageCode]['soup'];}
  String get meat {
    return _localizedValues[locale.languageCode]['meat'];}
  String get porridgePotato {
    return _localizedValues[locale.languageCode]['porridgePotato'];}
  String get bread {
    return _localizedValues[locale.languageCode]['bread'];}
  String get drink {
    return _localizedValues[locale.languageCode]['drink'];}
  String get baking {
    return _localizedValues[locale.languageCode]['baking'];}
  String get cake {
    return _localizedValues[locale.languageCode]['cake'];}
  String get sandwich {
    return _localizedValues[locale.languageCode]['sandwich'];}

  String get g {
    return _localizedValues[locale.languageCode]['g'];}



}

