import 'package:ps_pedometer/data/models/health_details_model.dart';

abstract class HealthDetailsEvent {}

class SetHealthDetailsEvent implements HealthDetailsEvent {
  SetHealthDetailsEvent(this.healthDetailsModel);

  final HealthDetailsModel healthDetailsModel;
}
