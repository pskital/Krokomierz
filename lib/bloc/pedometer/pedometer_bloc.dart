import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pedometer/pedometer.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_event.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_state.dart';
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart';
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository.dart';

@Singleton()
class PedometerBloc extends Bloc<PedometerEvent, PedometerState> {
  PedometerBloc(
    MeasurementSystemRepository measurementSystemRepository,
    YourGoalSettingsRepository yourGoalSettingsRepository,
    HealthDetailsRepository healthDetailsRepository,
  ) : super(
          PedometerState(
            stepCount: null,
            yourGoalSettingsModel:
                yourGoalSettingsRepository.getYourGoalSettingsModel(),
            measurementSystemModel:
                measurementSystemRepository.getMeasurementSystemModel(),
            healthDetailsModel: healthDetailsRepository.getHealthDetailsModel(),
          ),
        ) {
    on<UpdateMeasurementSystemEvent>(_onUpdateMeasurementSystem);
    on<UpdateYourGoalEvent>(_onUpdateYourGoal);
    on<StepCountEvent>(_onStepEvent);
    initPlatformState();
  }

  StreamSubscription<StepCount>? _stepCountSubscription;

  void initPlatformState() {
    _stepCountSubscription = Pedometer.stepCountStream.listen(_onStepCount);
  }

  void _onStepCount(StepCount event) {
    add(StepCountEvent(stepCount: event));
  }

  void _onStepEvent(
    StepCountEvent event,
    Emitter<PedometerState> emit,
  ) {
    final StepCount stepCount = event.stepCount;
    emit(
      state.copyWith(stepCount: stepCount),
    );
  }

  FutureOr<void> _onUpdateYourGoal(
    UpdateYourGoalEvent event,
    Emitter<PedometerState> emit,
  ) {
    emit(
      state.copyWith(yourGoalSettingsModel: event.yourGoalSettingsModel),
    );
  }

  FutureOr<void> _onUpdateMeasurementSystem(
    UpdateMeasurementSystemEvent event,
    Emitter<PedometerState> emit,
  ) {
    emit(
      state.copyWith(measurementSystemModel: event.measurementSystemModel),
    );
  }

  @override
  Future<void> close() {
    _stepCountSubscription?.cancel();
    return super.close();
  }
}
