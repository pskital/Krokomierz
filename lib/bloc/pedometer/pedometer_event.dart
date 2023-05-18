import 'package:pedometer/pedometer.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';

abstract class PedometerEvent {}

class StepCountEvent extends PedometerEvent {
  StepCountEvent({required this.stepCount});

  final StepCount stepCount;
}

class UpdateYourGoalEvent extends PedometerEvent {
  UpdateYourGoalEvent({required this.yourGoalSettingsModel});

  final YourGoalSettingsModel yourGoalSettingsModel;
}

class UpdateMeasurementSystemEvent extends PedometerEvent {
  UpdateMeasurementSystemEvent({required this.measurementSystemModel});

  final MeasurementSystemModel measurementSystemModel;
}
