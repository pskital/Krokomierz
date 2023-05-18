import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:ps_pedometer/core/utils/copyable.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';

part 'health_details_model.g.dart';

@HiveType(typeId: LocalStorageConstants.healthDetailsTypeId)
class HealthDetailsModel extends Equatable
    implements Copyable<HealthDetailsModel> {
  const HealthDetailsModel({
    required this.gender,
    required this.weight,
    required this.height,
  });

  @HiveField(0)
  final String gender;
  @HiveField(1)
  final int weight;
  @HiveField(2)
  final int height;

  @override
  HealthDetailsModel copyWith({
    String? gender,
    int? weight,
    int? height,
  }) =>
      HealthDetailsModel(
        gender: gender ?? this.gender,
        weight: weight ?? this.weight,
        height: height ?? this.height,
      );

  @override
  List<Object> get props => [gender, weight, height];
}
