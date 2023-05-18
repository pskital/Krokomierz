import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/pedometer/pedometer_bloc.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/ui/screens/base_page.dart';
import 'package:ps_pedometer/ui/screens/home/home_view.dart';

class HomePage extends BasePage {
  @override
  Widget onCreateView(BuildContext context) {
    return HomeView();
  }

  @override
  List<BlocProvider> onCreateBlocProviders(BuildContext context) {
    return [
      BlocProvider<PedometerBloc>(
        create: (_) {
          return getIt();
        },
      )
    ];
  }
}
