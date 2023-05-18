import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ps_pedometer/data/injection/environment_type.dart';
import 'package:ps_pedometer/data/injection/injection.config.dart';

final GetIt getIt = GetIt.instance;

const Environment mobileEnv = Environment(EnvironmentType.prodEnv);

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: false,
  asExtension: false,
)
Future<void> configureDependencies(String environment) => $initGetIt(
      getIt,
      environment: environment,
    );
