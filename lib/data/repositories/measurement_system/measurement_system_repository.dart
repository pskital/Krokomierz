import 'package:ps_pedometer/data/models/measurement_system_model.dart';

abstract class MeasurementSystemRepository {
  MeasurementSystemModel getMeasurementSystemModel();

  Future<void> setMeasurementSystemModel(
    MeasurementSystemModel measurementsSystemModel,
  );
}
