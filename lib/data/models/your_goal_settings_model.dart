import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:ps_pedometer/core/utils/copyable.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';

part 'your_goal_settings_model.g.dart';

@HiveType(typeId: LocalStorageConstants.yourGoalTypeId)
class YourGoalSettingsModel extends Equatable
    implements Copyable<YourGoalSettingsModel> {
  const YourGoalSettingsModel({
    required this.steps,
    required this.calories,
    required this.distance,
    required this.minutes,
  });

  @HiveField(0)
  final int steps;
  @HiveField(1)
  final int calories;
  @HiveField(2)
  final int distance;
  @HiveField(3)
  final int minutes;

  @override
  YourGoalSettingsModel copyWith({
    int? steps,
    int? calories,
    int? distance,
    int? minutes,
    int? floor,
  }) =>
      YourGoalSettingsModel(
        steps: steps ?? this.steps,
        calories: calories ?? this.calories,
        distance: distance ?? this.distance,
        minutes: minutes ?? this.minutes,
      );

  @override
  List<Object?> get props => [steps, calories, distance, minutes];
}
