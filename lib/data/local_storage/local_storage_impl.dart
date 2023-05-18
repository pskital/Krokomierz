import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';

class LocalStorageImpl implements LocalStorage {
  late Box _box;

  @override
  Future<void> init() async {
    if (Hive.isBoxOpen(LocalStorageConstants.hiveBox)) {
      return;
    }

    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    Hive.registerAdapter(YourGoalSettingsModelAdapter());
    Hive.registerAdapter(MeasurementSystemModelAdapter());
    Hive.registerAdapter(HealthDetailsModelAdapter());

    _box = await Hive.openBox(LocalStorageConstants.hiveBox);
  }

  @override
  Future<void> saveValue<T>(String key, T? value) async {
    return await _box.put(key, value);
  }

  @override
  T? getValue<T>(String key) {
    return _box.get(key);
  }

  @override
  List<T> getValues<T>(String key) {
    return _box.get(key, defaultValue: []).cast<T>();
  }
}
