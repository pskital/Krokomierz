import 'package:ps_pedometer/data/models/measurement_system_model.dart';

abstract class MeasurementSystemEvent {}

class SetMeasurementSystemEvent implements MeasurementSystemEvent {
  SetMeasurementSystemEvent(this.measurementSystemModel);

  final MeasurementSystemModel measurementSystemModel;
}
