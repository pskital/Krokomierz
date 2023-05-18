import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_state.dart';
import 'package:ps_pedometer/core/styles/styles.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';

class HomeStepCountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PedometerBloc, PedometerState>(
      builder: (BuildContext context, PedometerState state) => Text(
        translations.home.stepsCount(
          state.getStepCount(),
          state.yourGoalSettingsModel.steps,
        ),
        textAlign: TextAlign.center,
        style: Styles.heading1.copyWith(
          fontSize: MediaQuery.of(context).size.width * 0.055,
          height: 1,
        ),
      ),
    );
  }
}
