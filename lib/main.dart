import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/language/language_bloc.dart';
import 'package:ps_pedometer/data/injection/environment_type.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/pedometer_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies(EnvironmentType.prodEnv);
  if (!kDebugMode) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: <SystemUiOverlay>[SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>(create: (_) => getIt()),
      ],
      child: const PedometerApp(),
    ),
  );
}
