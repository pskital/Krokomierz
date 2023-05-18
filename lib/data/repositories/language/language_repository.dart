import 'package:ps_pedometer/data/repositories/language/lang_type.dart';

abstract class LanguageRepository {
  Future<void> saveLanguageType(LanguageType langType);

  LanguageType getLanguageType();

  String getSystemLanguage();

  String getLanguage();
}
