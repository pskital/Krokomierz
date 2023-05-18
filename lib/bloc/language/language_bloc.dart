import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/bloc/language/language_event.dart';
import 'package:ps_pedometer/bloc/language/language_state.dart';
import 'package:ps_pedometer/core/translations/app_translations.dart';
import 'package:ps_pedometer/data/repositories/language/lang_type.dart';
import 'package:ps_pedometer/data/repositories/language/language_repository.dart';

@Injectable()
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({
    required this.languageRepository,
    required this.appTranslations,
  }) : super(SetLanguageState(languageRepository.getLanguageType())) {
    on<ChangeSystemLanguageEvent>(_changeSystemLocale);
    on<SetLanguageEvent>(_setLanguage);

    _setTranslations();
  }

  final LanguageRepository languageRepository;
  final AppTranslations appTranslations;

  Future<void> _setLanguage(
    SetLanguageEvent event,
    Emitter<LanguageState> emit,
  ) async {
    final LanguageType? langType = event.langType;
    if (langType != null) {
      await languageRepository.saveLanguageType(langType);
      _setTranslations();
      emit(SetLanguageState(langType));
    }
  }

  String getLanguage() {
    return languageRepository.getLanguage();
  }

  void _changeSystemLocale(
    ChangeSystemLanguageEvent event,
    Emitter<LanguageState> emit,
  ) {
    if (state.langType == LanguageType.system) {
      _setTranslations();
      emit(
        ChangeSystemLocalesState(
          LanguageType.system,
          languageRepository.getSystemLanguage(),
        ),
      );
    }
  }

  void _setTranslations() {
    appTranslations.setTranslations(getLanguage());
  }
}
