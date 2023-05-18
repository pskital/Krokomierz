import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_bloc.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_event.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_state.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_type.dart';
import 'package:ps_pedometer/ui/widgets/bloc_builder_widget.dart';
import 'package:ps_pedometer/ui/widgets/custom_radio.dart';

class MeasurementSystemList
    extends BlocBuilderWidget<MeasurementSystemBloc, MeasurementSystemState> {
  @override
  Widget buildWidget(
    BuildContext context,
    MeasurementSystemBloc bloc,
    MeasurementSystemState state,
  ) {
    final MeasurementSystemModel measurementSystemModel =
        state.measurementSystemModel;
    return ListView(
      padding: const EdgeInsets.all(Spacing.spacing16),
      children: [
        CustomRadio<MeasurementSystemModel>(
          value: const MeasurementSystemModel(
            measurementSystem: MeasurementSystemType.METRICS,
          ),
          groupValue: measurementSystemModel,
          text: translations.settings.measurementSystemMetrics,
          onChanged: (MeasurementSystemModel? measurementSystemModel) =>
              bloc.add(SetMeasurementSystemEvent(measurementSystemModel!)),
        ),
        CustomRadio<MeasurementSystemModel>(
          value: const MeasurementSystemModel(
            measurementSystem: MeasurementSystemType.IMPERIAL,
          ),
          groupValue: measurementSystemModel,
          text: translations.settings.measurementSystemImperial,
          onChanged: (MeasurementSystemModel? measurementSystemModel) =>
              bloc.add(SetMeasurementSystemEvent(measurementSystemModel!)),
        )
      ],
    );
  }
}
