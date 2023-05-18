import 'package:flutter/material.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_state.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/ui/widgets/bloc_builder_widget.dart';
import 'package:ps_pedometer/ui/widgets/circular_progress_bar.dart';

class HomeStepCountProgressBar
    extends BlocBuilderWidget<PedometerBloc, PedometerState> {
  @override
  Widget buildWidget(
    BuildContext context,
    PedometerBloc bloc,
    PedometerState state,
  ) {
    return SimpleCircularProgressBar(
      progressColors: const [AppColors.orange],
      mergeMode: true,
      maxValue: state.yourGoalSettingsModel.steps,
      value: state.getStepCount(),
      size: MediaQuery.of(context).size.width * 0.6,
      progressStrokeWidth: 30,
      backStrokeWidth: 30,
    );
  }
}
