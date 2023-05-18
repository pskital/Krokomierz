import 'package:equatable/equatable.dart';
import 'package:pedometer/pedometer.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_gender_type.dart';
import 'package:ps_pedometer/core/utils/copyable.dart';
import 'package:ps_pedometer/core/utils/measurement_utils.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_type.dart';

class PedometerState extends Equatable implements Copyable<PedometerState> {
  const PedometerState({
    required this.measurementSystemModel,
    required this.yourGoalSettingsModel,
    required this.healthDetailsModel,
    StepCount? stepCount,
  }) : _stepCount = stepCount;

  final MeasurementSystemModel measurementSystemModel;
  final YourGoalSettingsModel yourGoalSettingsModel;
  final HealthDetailsModel healthDetailsModel;
  final StepCount? _stepCount;

  @override
  List<Object?> get props => [_stepCount, yourGoalSettingsModel];

  int getStepCount() {
    return _stepCount?.steps ?? 0;
  }

  @override
  PedometerState copyWith({
    StepCount? stepCount,
    YourGoalSettingsModel? yourGoalSettingsModel,
    MeasurementSystemModel? measurementSystemModel,
    HealthDetailsModel? healthDetailsModel,
  }) =>
      PedometerState(
        stepCount: stepCount ?? _stepCount,
        yourGoalSettingsModel:
            yourGoalSettingsModel ?? this.yourGoalSettingsModel,
        measurementSystemModel:
            measurementSystemModel ?? this.measurementSystemModel,
        healthDetailsModel: healthDetailsModel ?? this.healthDetailsModel,
      );

  int calculateCalories() {
    return 0;
  }

  int calculateDistance() {
    try {
      final double multiplier;
      if (healthDetailsModel.gender == HealthDetailsGenderType.MALE) {
        multiplier = 0.415;
      } else {
        multiplier = 0.413;
      }

      final int height;
      if (measurementSystemModel.measurementSystem ==
          MeasurementSystemType.METRICS) {
        height = healthDetailsModel.height.centimetersToInches();
      } else {
        height = healthDetailsModel.height;
      }

      final strideLength = height * multiplier;
      return (strideLength * _stepCount!.steps).toInt();
    } catch (e) {
      return 0;
    }
  }

  int calculateTime() {
    try {
      final timeStamp = _stepCount!.timeStamp;
      final difference = timeStamp.difference(DateTime.now());
      return difference.inMinutes;
    } catch (e) {
      return 0;
    }
  }
}
