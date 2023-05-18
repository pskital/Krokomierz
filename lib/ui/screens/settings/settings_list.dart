import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/assets/assets.gen.dart';
import 'package:ps_pedometer/core/navigation/routes.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/ui/screens/settings/settings_item.dart';

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Spacing.spacing16),
      children: [
        SettingsItem(
          title: translations.settings.goal,
          details: translations.settings.goalDetails,
          leadingImage: Assets.icons.iconGoal,
          onTapItem: () =>
              Navigator.of(context).pushNamed(Routes.settings_your_goal),
        ),
        SettingsItem(
          title: translations.settings.basicData,
          details: translations.settings.basicDataDetails,
          leadingImage: Assets.icons.iconHealthDetails,
          onTapItem: () =>
              Navigator.of(context).pushNamed(Routes.settings_health_details),
        ),
        SettingsItem(
          title: translations.settings.measurementSystem,
          details: translations.settings.measurementSystemDetails,
          leadingImage: Assets.icons.iconMeasurementSystem,
          onTapItem: () =>
              Navigator.of(context).pushNamed(Routes.settings_measurement_system),
        ),
      ],
    );
  }
}
