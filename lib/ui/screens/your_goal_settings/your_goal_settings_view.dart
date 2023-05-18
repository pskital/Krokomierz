import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/ui/screens/your_goal_settings/your_goal_settings_list.dart';

class YourGoalSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.settings.goal),
      ),
      body: YourGoalSettingsList(),
    );
  }
}
