import 'package:flutter/material.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_bloc.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_event.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_state.dart';
import 'package:ps_pedometer/core/assets/assets.gen.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_utils.dart';
import 'package:ps_pedometer/ui/screens/health_details/health_details_select_gender.dart';
import 'package:ps_pedometer/ui/widgets/bloc_builder_widget.dart';
import 'package:ps_pedometer/ui/widgets/set_value_widget.dart';

class HealthDetailsList
    extends BlocBuilderWidget<HealthDetailsBloc, HealthDetailsState> {
  @override
  Widget buildWidget(context, bloc, state) {
    final MeasurementSystemModel measurementSystemModel =
        state.measurementSystemModel;
    final HealthDetailsModel healthDetailsModel = state.healthDetailsModel;
    return ListView(
      padding: const EdgeInsets.all(Spacing.spacing16),
      children: [
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              SetHealthDetailsEvent(healthDetailsModel.copyWith(height: value)),
            );
          },
          leadingImage: Assets.icons.iconHeight,
          minValue: 10,
          maxValue: 1000,
          title: '${translations.settings.height} '
              '${getHeightUnit(measurementSystemModel)}',
          modificationValue: 1,
          value: healthDetailsModel.height,
        ),
        SetValueWidget(
          onValueChange: (int value) {
            bloc.add(
              SetHealthDetailsEvent(healthDetailsModel.copyWith(weight: value)),
            );
          },
          leadingImage: Assets.icons.iconWeight,
          minValue: 10,
          maxValue: 1000,
          title: '${translations.settings.weight} '
              '${getWeightUnit(measurementSystemModel)}',
          modificationValue: 1,
          value: healthDetailsModel.weight,
        ),
        HealthDetailsSelectGender(),
      ],
    );
  }
}
