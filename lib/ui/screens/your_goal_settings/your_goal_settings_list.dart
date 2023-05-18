import 'package:flutter/material.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_bloc.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_event.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_state.dart';
import 'package:ps_pedometer/core/assets/assets.gen.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/core/utils/date_time_utils.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_utils.dart';
import 'package:ps_pedometer/ui/widgets/bloc_builder_widget.dart';
import 'package:ps_pedometer/ui/widgets/set_value_widget.dart';

class YourGoalSettingsList
    extends BlocBuilderWidget<YourGoalSettingsBloc, YourGoalSettingsState> {
  @override
  Widget buildWidget(context, bloc, state) {
    final MeasurementSystemModel measurementSystemModel =
        state.measurementSystemModel;
    final YourGoalSettingsModel goalSettings = state.goalSettingsModel;
    return ListView(
      padding: const EdgeInsets.all(Spacing.spacing16),
      children: [
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              YourGoalSettingsSetEvent(goalSettings.copyWith(steps: value)),
            );
          },
          leadingImage: Assets.icons.iconSteps,
          minValue: 500,
          maxValue: 99000,
          title: translations.settings.steps,
          modificationValue: 500,
          value: goalSettings.steps,
        ),
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              YourGoalSettingsSetEvent(goalSettings.copyWith(calories: value)),
            );
          },
          leadingImage: Assets.icons.iconCalories,
          minValue: 50,
          maxValue: 10000,
          title: translations.settings.calories,
          modificationValue: 50,
          value: goalSettings.calories,
        ),
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              YourGoalSettingsSetEvent(goalSettings.copyWith(distance: value)),
            );
          },
          leadingImage: Assets.icons.iconDistance,
          minValue: 500,
          maxValue: 99000,
          title: getDistanceUnit(measurementSystemModel),
          modificationValue: 500,
          value: goalSettings.distance,
          displayValue: '${goalSettings.distance / 1000}',
        ),
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              YourGoalSettingsSetEvent(goalSettings.copyWith(minutes: value)),
            );
          },
          leadingImage: Assets.icons.iconClock,
          minValue: 5,
          maxValue: 1440,
          title: translations.settings.time,
          modificationValue: 5,
          value: goalSettings.minutes,
          displayValue: formatMinutes(goalSettings.minutes),
        )
      ],
    );
  }
}
