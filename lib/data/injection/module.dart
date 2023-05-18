import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/data/injection/environment_type.dart';
import 'package:ps_pedometer/data/local_storage/local_storage.dart';
import 'package:ps_pedometer/data/local_storage/local_storage_impl.dart';

@module
abstract class Module {
  @preResolve
  @Singleton(env: [EnvironmentType.prodEnv])
  Future<LocalStorage> provideLocalStorage() async {
    final LocalStorage localStorage = LocalStorageImpl();
    await localStorage.init();
    return localStorage;
  }
}
