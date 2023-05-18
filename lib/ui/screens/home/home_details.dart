import 'package:flutter/cupertino.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_state.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_utils.dart';
import 'package:ps_pedometer/ui/screens/home/home_details_item.dart';
import 'package:ps_pedometer/ui/widgets/bloc_builder_widget.dart';

class HomeDetails extends BlocBuilderWidget<PedometerBloc, PedometerState> {
  @override
  Widget buildWidget(
    BuildContext context,
    PedometerBloc bloc,
    PedometerState state,
  ) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.spacing16),
      child: Column(
        children: [
          HomeDetailsItem(
            title: translations.home.calories,
            value: state.calculateCalories(),
            goalValue: state.yourGoalSettingsModel.calories,
          ),
          HomeDetailsItem(
            title: getDistanceUnit(state.measurementSystemModel),
            value: state.calculateCalories(),
            goalValue: state.yourGoalSettingsModel.distance,
          ),
          HomeDetailsItem(
            title: translations.home.time,
            value: state.calculateTime(),
            goalValue: state.yourGoalSettingsModel.minutes,
          )
        ],
      ),
    );
  }
}
