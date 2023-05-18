import 'package:ps_pedometer/data/models/health_details_model.dart';

abstract class HealthDetailsRepository {
  HealthDetailsModel getHealthDetailsModel();

  Future<void> setHealthDetailsModel(HealthDetailsModel healthDetailsModel);
}
