import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_event.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_state.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository.dart';
import 'package:ps_pedometer/data/repositories/measurement_system/measurement_system_repository.dart';

@Injectable()
class HealthDetailsBloc extends Bloc<HealthDetailsEvent, HealthDetailsState> {
  HealthDetailsBloc(
    this.measurementSystemRepository,
    this.healthDetailsRepository,
  ) : super(
          HealthDetailsState(
            measurementSystemModel:
                measurementSystemRepository.getMeasurementSystemModel(),
            healthDetailsModel: healthDetailsRepository.getHealthDetailsModel(),
          ),
        ) {
    on<SetHealthDetailsEvent>(_handleHealStateChange);
  }

  final MeasurementSystemRepository measurementSystemRepository;
  final HealthDetailsRepository healthDetailsRepository;

  FutureOr<void> _handleHealStateChange(
    SetHealthDetailsEvent event,
    Emitter<HealthDetailsState> emit,
  ) async {
    final HealthDetailsModel healthDetailsModel = event.healthDetailsModel;
    await healthDetailsRepository.setHealthDetailsModel(healthDetailsModel);

    emit(
      HealthDetailsState(
        healthDetailsModel: healthDetailsModel,
        measurementSystemModel: state.measurementSystemModel,
      ),
    );
  }
}
