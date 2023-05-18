import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_type.dart';

String getDistanceUnit(MeasurementSystemModel measurementSystemModel) {
  switch (measurementSystemModel.measurementSystem) {
    case MeasurementSystemType.IMPERIAL:
      return translations.settings.miles;
    case MeasurementSystemType.METRICS:
      return translations.settings.kilometers;
    default:
      throw ArgumentError();
  }
}

String getWeightUnit(MeasurementSystemModel measurementSystemModel) {
  switch (measurementSystemModel.measurementSystem) {
    case MeasurementSystemType.IMPERIAL:
      return '(lbs)';
    case MeasurementSystemType.METRICS:
      return '(kg)';
    default:
      throw ArgumentError();
  }
}

String getHeightUnit(MeasurementSystemModel measurementSystemModel) {
  switch (measurementSystemModel.measurementSystem) {
    case MeasurementSystemType.IMPERIAL:
      return '(in)';
    case MeasurementSystemType.METRICS:
      return '(cm)';
    default:
      throw ArgumentError();
  }
}
