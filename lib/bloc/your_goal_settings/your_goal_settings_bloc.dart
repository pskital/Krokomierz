import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_event.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_event.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_state.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart';
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository.dart';

@Injectable()
class YourGoalSettingsBloc
    extends Bloc<GoalSettingsEvent, YourGoalSettingsState> {
  YourGoalSettingsBloc(
    this.yourGoalSettingsRepository,
    this.measurementSystemRepository,
  ) : super(
          YourGoalSettingsState(
            goalSettingsModel:
                yourGoalSettingsRepository.getYourGoalSettingsModel(),
            measurementSystemModel:
                measurementSystemRepository.getMeasurementSystemModel(),
          ),
        ) {
    on<YourGoalSettingsSetEvent>(_handleGoalSettingsChange);
  }

  final MeasurementSystemRepository measurementSystemRepository;
  final YourGoalSettingsRepository yourGoalSettingsRepository;

  FutureOr<void> _handleGoalSettingsChange(
    YourGoalSettingsSetEvent event,
    Emitter<YourGoalSettingsState> emit,
  ) async {
    final YourGoalSettingsModel goalSettingsModel = event.goalSettingsModel;
    await yourGoalSettingsRepository.setYourGoalModel(goalSettingsModel);

    getIt<PedometerBloc>().add(
      UpdateYourGoalEvent(
        yourGoalSettingsModel: goalSettingsModel,
      ),
    );

    emit(
      YourGoalSettingsState(
        goalSettingsModel: goalSettingsModel,
        measurementSystemModel: state.measurementSystemModel,
      ),
    );
  }
}
