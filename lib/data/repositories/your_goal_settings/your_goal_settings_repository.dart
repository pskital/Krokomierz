import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';

abstract class YourGoalSettingsRepository {
  YourGoalSettingsModel getYourGoalSettingsModel();

  Future<void> setYourGoalModel(YourGoalSettingsModel goalModel);
}
