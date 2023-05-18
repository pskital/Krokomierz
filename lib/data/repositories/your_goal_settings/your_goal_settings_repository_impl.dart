import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository.dart';

@Injectable(as: YourGoalSettingsRepository)
class YourGoalSettingsRepositoryImpl implements YourGoalSettingsRepository {
  const YourGoalSettingsRepositoryImpl({required this.localStorage});

  final LocalStorage localStorage;

  @override
  YourGoalSettingsModel getYourGoalSettingsModel() {
    return localStorage
            .getValue<YourGoalSettingsModel?>(LocalStorageConstants.yourGoalKey) ??
        const YourGoalSettingsModel(
          steps: 6000,
          calories: 1500,
          distance: 2000,
          minutes: 45,
        );
  }

  @override
  Future<void> setYourGoalModel(YourGoalSettingsModel goalSettingModel) async {
    await localStorage.saveValue(
      LocalStorageConstants.yourGoalKey,
      goalSettingModel,
    );
  }
}
