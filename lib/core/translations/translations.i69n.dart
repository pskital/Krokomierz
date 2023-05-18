// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;

String get _languageCode => 'en';
String get _localeName => 'en';

String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i69n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class Translations implements i69n.I69nMessageBundle {
  const Translations();
  HomeTranslations get home => HomeTranslations(this);
  SettingsTranslations get settings => SettingsTranslations(this);
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'home':
        return home;
      case 'settings':
        return settings;
      default:
        return key;
    }
  }
}

class HomeTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const HomeTranslations(this._parent);
  String get pedometer => "Pedometer";
  String stepsCount(int count, int maxCount) =>
      "$count/$maxCount\n${_plural(count, zero: 'kroków', one: 'step', many: 'steps')}";
  String get calories => "Calories (Kcal)";
  String get miles => "Distance (Miles)";
  String get kilometers => "Distance (Km)";
  String get time => "Time";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'pedometer':
        return pedometer;
      case 'stepsCount':
        return stepsCount;
      case 'calories':
        return calories;
      case 'miles':
        return miles;
      case 'kilometers':
        return kilometers;
      case 'time':
        return time;
      default:
        return key;
    }
  }
}

class SettingsTranslations implements i69n.I69nMessageBundle {
  final Translations _parent;
  const SettingsTranslations(this._parent);
  String get settings => "Pedometer Settings";
  String get goal => "Your goal";
  String get goalDetails => "Steps, Calories, Distance";
  String get steps => "Steps";
  String get calories => "Calories (Kcal)";
  String get miles => "Distance (Miles)";
  String get kilometers => "Distance (Km)";
  String get time => "Time";
  String get basicData => "Health details";
  String get basicDataDetails => "Weight, Height, Gender";
  String get measurementSystem => "Measurement system";
  String get measurementSystemDetails => "Imperial / Metrics";
  String get measurementSystemImperial => "Imperial";
  String get measurementSystemMetrics => "Metrics";
  String get selectGender => "Gender";
  String get male => "Male";
  String get female => "Female";
  String get height => "Height";
  String get weight => "Weight";
  Object operator [](String key) {
    var index = key.indexOf('.');
    if (index > 0) {
      return (this[key.substring(0, index)]
          as i69n.I69nMessageBundle)[key.substring(index + 1)];
    }
    switch (key) {
      case 'settings':
        return settings;
      case 'goal':
        return goal;
      case 'goalDetails':
        return goalDetails;
      case 'steps':
        return steps;
      case 'calories':
        return calories;
      case 'miles':
        return miles;
      case 'kilometers':
        return kilometers;
      case 'time':
        return time;
      case 'basicData':
        return basicData;
      case 'basicDataDetails':
        return basicDataDetails;
      case 'measurementSystem':
        return measurementSystem;
      case 'measurementSystemDetails':
        return measurementSystemDetails;
      case 'measurementSystemImperial':
        return measurementSystemImperial;
      case 'measurementSystemMetrics':
        return measurementSystemMetrics;
      case 'selectGender':
        return selectGender;
      case 'male':
        return male;
      case 'female':
        return female;
      case 'height':
        return height;
      case 'weight':
        return weight;
      default:
        return key;
    }
  }
}
