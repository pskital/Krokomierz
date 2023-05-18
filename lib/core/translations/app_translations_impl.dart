import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/core/translations/app_translations.dart';
import 'package:ps_pedometer/core/translations/translation_constants.dart';
import 'package:ps_pedometer/core/translations/translations.i69n.dart';
import 'package:ps_pedometer/core/translations/translations_pl.i69n.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/data/repositories/language/language_repository.dart';

@LazySingleton(as: AppTranslations)
class AppTranslationsImpl implements AppTranslations {
  AppTranslationsImpl({required this.languageRepository});

  final LanguageRepository languageRepository;

  Translations? _translations;

  final Map<String, Translations> _translationsMap = <String, Translations>{
    TranslationConstants.languageEN: const Translations(),
    TranslationConstants.languagePL: const Translations_pl(),
  };

  @override
  void setTranslations(String language) {
    _translations = _translationsMap[language]!;
  }

  @override
  Translations getTranslations() {
    return _translations ??
        _translationsMap[TranslationConstants.defaultAppLanguage]!;
  }
}

Translations get translations => getIt<AppTranslations>().getTranslations();
