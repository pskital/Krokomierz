// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:ps_pedometer/bloc/health_details/health_details_bloc.dart'
    as _i17;
import 'package:ps_pedometer/bloc/language/language_bloc.dart' as _i18;
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_bloc.dart'
    as _i12;
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart' as _i13;
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_bloc.dart'
    as _i14;
import 'package:ps_pedometer/core/translations/app_translations.dart' as _i15;
import 'package:ps_pedometer/core/translations/app_translations_impl.dart'
    as _i16;
import 'package:ps_pedometer/data/injection/module.dart' as _i19;
import 'package:ps_pedometer/data/local_storage/local_storage.dart' as _i3;
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository.dart'
    as _i8;
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository_impl.dart'
    as _i9;
import 'package:ps_pedometer/data/repositories/language/language_repository.dart'
    as _i10;
import 'package:ps_pedometer/data/repositories/language/language_repository_impl.dart'
    as _i11;
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart'
    as _i4;
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository_impl.dart'
    as _i5;
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository.dart'
    as _i6;
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository_impl.dart'
    as _i7;

const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final module = _$Module();
  await gh.singletonAsync<_i3.LocalStorage>(
    () => module.provideLocalStorage(),
    registerFor: {_prod},
    preResolve: true,
  );
  gh.factory<_i4.MeasurementSystemRepository>(() =>
      _i5.MeasurementSystemRepositoryImpl(
          localStorage: get<_i3.LocalStorage>()));
  gh.factory<_i6.YourGoalSettingsRepository>(() =>
      _i7.YourGoalSettingsRepositoryImpl(
          localStorage: get<_i3.LocalStorage>()));
  gh.factory<_i8.HealthDetailsRepository>(() =>
      _i9.HealthDetailsRepositoryImpl(localStorage: get<_i3.LocalStorage>()));
  gh.lazySingleton<_i10.LanguageRepository>(
      () => _i11.LanguageRepositoryImpl(localStorage: get<_i3.LocalStorage>()));
  gh.factory<_i12.MeasurementSystemBloc>(() => _i12.MeasurementSystemBloc(
        get<_i4.MeasurementSystemRepository>(),
        get<_i6.YourGoalSettingsRepository>(),
        get<_i8.HealthDetailsRepository>(),
      ));
  gh.singleton<_i13.PedometerBloc>(_i13.PedometerBloc(
    get<_i4.MeasurementSystemRepository>(),
    get<_i6.YourGoalSettingsRepository>(),
    get<_i8.HealthDetailsRepository>(),
  ));
  gh.factory<_i14.YourGoalSettingsBloc>(() => _i14.YourGoalSettingsBloc(
        get<_i6.YourGoalSettingsRepository>(),
        get<_i4.MeasurementSystemRepository>(),
      ));
  gh.lazySingleton<_i15.AppTranslations>(() => _i16.AppTranslationsImpl(
      languageRepository: get<_i10.LanguageRepository>()));
  gh.factory<_i17.HealthDetailsBloc>(() => _i17.HealthDetailsBloc(
        get<_i4.MeasurementSystemRepository>(),
        get<_i8.HealthDetailsRepository>(),
      ));
  gh.factory<_i18.LanguageBloc>(() => _i18.LanguageBloc(
        languageRepository: get<_i10.LanguageRepository>(),
        appTranslations: get<_i15.AppTranslations>(),
      ));
  return get;
}

class _$Module extends _i19.Module {}
