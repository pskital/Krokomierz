import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/core/translations/translation_constants.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';
import 'package:ps_pedometer/data/repositories/language/lang_type.dart';
import 'package:ps_pedometer/data/repositories/language/language_repository.dart';

@LazySingleton(as: LanguageRepository)
class LanguageRepositoryImpl implements LanguageRepository {
  const LanguageRepositoryImpl({required this.localStorage});

  final LocalStorage localStorage;

  @override
  Future<void> saveLanguageType(LanguageType langType) async {
    return await localStorage.saveValue(
      LocalStorageConstants.langKey,
      langType.value,
    );
  }

  @override
  LanguageType getLanguageType() {
    try {
      final String language =
          localStorage.getValue(LocalStorageConstants.langKey);
      return LanguageType.values.byName(language);
    } catch (_) {
      return LanguageType.system;
    }
  }

  @override
  String getLanguage() {
    final LanguageType langType = getLanguageType();
    final String language;
    switch (langType) {
      case LanguageType.system:
        language = getSystemLanguage();
        break;
      default:
        language = langType.value;
        break;
    }

    if (TranslationConstants.supportedLanguages.contains(language)) {
      return language;
    } else {
      return TranslationConstants.defaultAppLanguage;
    }
  }

  @override
  String getSystemLanguage() {
    return WidgetsBinding.instance.window.locales.first.languageCode;
  }
}
