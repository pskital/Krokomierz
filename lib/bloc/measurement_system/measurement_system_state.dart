import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';

@immutable
class MeasurementSystemState extends Equatable {
  const MeasurementSystemState({
    required this.measurementSystemModel,
  });

  final MeasurementSystemModel measurementSystemModel;

  @override
  List<MeasurementSystemModel> get props => [measurementSystemModel];
}
