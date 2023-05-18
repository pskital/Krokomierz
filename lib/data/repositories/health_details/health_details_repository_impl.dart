import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_gender_type.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_constants.dart';
import 'package:ps_pedometer/data/models/health_details_model.dart';
import 'package:ps_pedometer/data/repositories/health_details/health_details_repository.dart';

@Injectable(as: HealthDetailsRepository)
class HealthDetailsRepositoryImpl implements HealthDetailsRepository {
  const HealthDetailsRepositoryImpl({required this.localStorage});

  final LocalStorage localStorage;

  @override
  HealthDetailsModel getHealthDetailsModel() {
    return localStorage.getValue(LocalStorageConstants.healthDetailsKey) ??
        const HealthDetailsModel(
          gender: HealthDetailsGenderType.MALE,
          weight: 70,
          height: 175,
        );
  }

  @override
  Future<void> setHealthDetailsModel(
    HealthDetailsModel healthDetailsModel,
  ) async {
    await localStorage.saveValue(
      LocalStorageConstants.healthDetailsKey,
      healthDetailsModel,
    );
  }
}
