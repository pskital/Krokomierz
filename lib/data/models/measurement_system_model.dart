import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';

part 'measurement_system_model.g.dart';

@HiveType(typeId: LocalStorageConstants.measurementTypeId)
class MeasurementSystemModel extends Equatable {
  const MeasurementSystemModel({
    required this.measurementSystem,
  });

  @HiveField(0)
  final String measurementSystem;

  @override
  List<String> get props => [measurementSystem];
}
