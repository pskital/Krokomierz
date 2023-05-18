import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_event.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_state.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_event.dart';
import 'package:ps_pedometer/core/utils/measurement_utils.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/models/measurement_system_model.dart';
import 'package:ps_pedometer/data/models/your_goal_settings_model.dart';
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_type.dart';
import 'package:ps_pedometer/data/repositories/your_goal_settings/your_goal_settings_repository.dart';

@Injectable()
class MeasurementSystemBloc
    extends Bloc<MeasurementSystemEvent, MeasurementSystemState> {
  MeasurementSystemBloc(
    this.measurementSystemRepository,
    this.yourGoalSettingsRepository,
    this.healthDetailsRepository,
  ) : super(
          MeasurementSystemState(
            measurementSystemModel:
                measurementSystemRepository.getMeasurementSystemModel(),
          ),
        ) {
    on<SetMeasurementSystemEvent>(_setMeasurementSystem);
  }

  final MeasurementSystemRepository measurementSystemRepository;
  final YourGoalSettingsRepository yourGoalSettingsRepository;
  final HealthDetailsRepository healthDetailsRepository;

  FutureOr<void> _setMeasurementSystem(
    SetMeasurementSystemEvent event,
    Emitter<MeasurementSystemState> emit,
  ) async {
    final MeasurementSystemModel measurementSystemModel =
        event.measurementSystemModel;
    await measurementSystemRepository
        .setMeasurementSystemModel(measurementSystemModel);

    await _convertUnits(measurementSystemModel);

    emit(
      MeasurementSystemState(
        measurementSystemModel: measurementSystemModel,
      ),
    );

    getIt<PedometerBloc>().add(
      UpdateMeasurementSystemEvent(
        measurementSystemModel: measurementSystemModel,
      ),
    );
  }

  Future<void> _convertUnits(
    MeasurementSystemModel measurementSystemModel,
  ) async {
    final YourGoalSettingsModel yourGoalSettingsModel =
        yourGoalSettingsRepository.getYourGoalSettingsModel();

    final HealthDetailsModel healthDetailsModel =
        healthDetailsRepository.getHealthDetailsModel();

    final int srcDistance = yourGoalSettingsModel.distance;
    final int srcWeight = healthDetailsModel.weight;
    final int srcHeight = healthDetailsModel.height;

    final int destDistance;
    final int destWeight;
    final int destHeight;
    switch (measurementSystemModel.measurementSystem) {
      case MeasurementSystemType.METRICS:
        final double tempDistance = srcDistance.toMetersInKilometers() / 500;
        destDistance = 500 * tempDistance.ceil();
        destWeight = srcWeight.lbsToKilograms();
        destHeight = srcHeight.inchesToCentimeters();
        break;
      case MeasurementSystemType.IMPERIAL:
        final double tempDistance = srcDistance.toMetersInMiles() / 500;
        destDistance = 500 * tempDistance.ceil();
        destWeight = srcWeight.kilogramsToLbs();
        destHeight = srcHeight.centimetersToInches();
        break;
      default:
        throw ArgumentError();
    }

    await yourGoalSettingsRepository.setYourGoalModel(
      yourGoalSettingsModel.copyWith(distance: destDistance),
    );

    await healthDetailsRepository.setHealthDetailsModel(
      healthDetailsModel.copyWith(
        weight: destWeight,
        height: destHeight,
      ),
    );
  }
}
