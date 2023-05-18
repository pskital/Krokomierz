import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ps_pedometer/bloc/language/language_bloc.dart';
import 'package:ps_pedometer/bloc/language/language_event.dart';
import 'package:ps_pedometer/core/navigation/navigation.dart';
import 'package:ps_pedometer/core/navigation/routes.dart';
import 'package:ps_pedometer/core/theme/dark_theme.dart';
import 'package:ps_pedometer/core/theme/light_theme.dart';
import 'package:ps_pedometer/ui/widgets/multi_bloc_builder.dart';

class PedometerApp extends StatefulWidget {
  const PedometerApp({super.key});

  @override
  State<PedometerApp> createState() => _PedometerApp();
}

class _PedometerApp extends State<PedometerApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MultiBlocBuilder(
      builder: (BuildContext context, BlocStates states) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: LightTheme().get(),
        darkTheme: DarkTheme().get(),
        initialRoute: Routes.home,
        onGenerateRoute: Navigation.onGenerateRoute,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
      blocs: [context.read<LanguageBloc>()],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    super.didChangeLocales(locales);
    context.read<LanguageBloc>().add(const ChangeSystemLanguageEvent());
  }
}
