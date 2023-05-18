import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';

@immutable
class YourGoalSettingsState extends Equatable {
  const YourGoalSettingsState({
    required this.measurementSystemModel,
    required this.goalSettingsModel,
  });

  final YourGoalSettingsModel goalSettingsModel;
  final MeasurementSystemModel measurementSystemModel;

  @override
  List<Object> get props => [goalSettingsModel, measurementSystemModel];
}
