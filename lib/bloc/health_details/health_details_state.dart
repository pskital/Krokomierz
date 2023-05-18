import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';

@immutable
class HealthDetailsState extends Equatable {
  const HealthDetailsState({
    required this.measurementSystemModel,
    required this.healthDetailsModel,
  });

  final MeasurementSystemModel measurementSystemModel;
  final HealthDetailsModel healthDetailsModel;

  @override
  List<HealthDetailsModel> get props => [healthDetailsModel];
}
