import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_type.dart';

@Injectable(as: MeasurementSystemRepository)
class MeasurementSystemRepositoryImpl implements MeasurementSystemRepository {
  const MeasurementSystemRepositoryImpl({required this.localStorage});

  final LocalStorage localStorage;

  @override
  MeasurementSystemModel getMeasurementSystemModel() {
    return localStorage.getValue<MeasurementSystemModel?>(
          LocalStorageConstants.measurementSystemKey,
        ) ??
        const MeasurementSystemModel(
          measurementSystem: MeasurementSystemType.METRICS,
        );
  }

  @override
  Future<void> setMeasurementSystemModel(
    MeasurementSystemModel measurementsModel,
  ) async {
    await localStorage.saveValue(
      LocalStorageConstants.measurementSystemKey,
      measurementsModel,
    );
  }
}
