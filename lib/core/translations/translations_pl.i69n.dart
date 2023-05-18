// ignore_for_file: unused_element, unused_field, camel_case_types, annotate_overrides, prefer_single_quotes
// GENERATED FILE, do not edit!
import 'package:i69n/i69n.dart' as i69n;
import 'translations.i69n.dart';

String get _languageCode => 'pl';
String get _localeName => 'pl';

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

class Translations_pl extends Translations {
  const Translations_pl();
  HomeTranslations_pl get home => HomeTranslations_pl(this);
  SettingsTranslations_pl get settings => SettingsTranslations_pl(this);
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
        return super[key];
    }
  }
}

class HomeTranslations_pl extends HomeTranslations {
  final Translations_pl _parent;
  const HomeTranslations_pl(this._parent) : super(_parent);
  String get pedometer => "Krokomierz";
  String stepsCount(int count, int maxCount) =>
      "$count/$maxCount\n${_plural(count, zero: 'kroków', one: 'krok', many: 'kroki')}";
  String get calories => "Kalorie (Kcal)";
  String get miles => "Dystans (Mile)";
  String get kilometers => "Dystans (Km)";
  String get time => "Czas";
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
        return super[key];
    }
  }
}

class SettingsTranslations_pl extends SettingsTranslations {
  final Translations_pl _parent;
  const SettingsTranslations_pl(this._parent) : super(_parent);
  String get settings => "Ustawienia krokomierza";
  String get goal => "Twój cel";
  String get goalDetails => "Kroki, Kalorie, Dystans";
  String get steps => "Kroki";
  String get calories => "Kalorie (Kcal)";
  String get miles => "Dystans (Mile)";
  String get kilometers => "Dystans (Km)";
  String get time => "Czas";
  String get basicData => "Podstawowe dane";
  String get basicDataDetails => "Waga, wzrost, płeć";
  String get measurementSystem => "System miar";
  String get measurementSystemDetails => "Imperial / Metrics";
  String get measurementSystemImperial => "Imperialny";
  String get measurementSystemMetrics => "Metryczny";
  String get selectGender => "Płeć";
  String get male => "Mężczyzna";
  String get female => "Kobieta";
  String get height => "Wzrost";
  String get weight => "Waga";
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
        return super[key];
    }
  }
}
