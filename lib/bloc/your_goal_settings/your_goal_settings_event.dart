import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';

abstract class GoalSettingsEvent {}

class YourGoalSettingsSetEvent implements GoalSettingsEvent {
  YourGoalSettingsSetEvent(this.goalSettingsModel);

  final YourGoalSettingsModel goalSettingsModel;
}
