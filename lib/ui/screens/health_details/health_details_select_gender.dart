import 'package:flutter/material.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_bloc.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_event.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_gender_type.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/ui/widgets/bloc_widget.dart';
import 'package:ps_pedometer/ui/widgets/custom_radio.dart';

class HealthDetailsSelectGender extends BlocWidget<HealthDetailsBloc> {
  @override
  Widget buildWidget(BuildContext context, HealthDetailsBloc bloc) {
    final HealthDetailsModel healthDetailsModel = bloc.state.healthDetailsModel;
    final String gender = bloc.state.healthDetailsModel.gender;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(translations.settings.selectGender, style: Styles.heading4),
        const SizedBox(height: Spacing.spacing12),
        CustomRadio<String>(
          value: HealthDetailsGenderType.MALE,
          groupValue: gender,
          text: translations.settings.male,
          onChanged: (String? gender) => bloc.add(
            SetHealthDetailsEvent(
              healthDetailsModel.copyWith(gender: gender),
            ),
          ),
        ),
        CustomRadio<String>(
          value: HealthDetailsGenderType.FEMALE,
          groupValue: gender,
          text: translations.settings.female,
          onChanged: (String? gender) => bloc.add(
            SetHealthDetailsEvent(
              healthDetailsModel.copyWith(gender: gender),
            ),
          ),
        ),
      ],
    );
  }
}
