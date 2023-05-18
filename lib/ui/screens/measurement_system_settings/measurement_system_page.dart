import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/measurement_system/measurement_system_bloc.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/ui/screens/base_page.dart';
import 'package:ps_pedometer/ui/screens/measurement_system_settings/measurement_system_view.dart';

class MeasurementSystemPage extends BasePage {
  @override
  Widget onCreateView(BuildContext context) {
    return MeasurementSystemView();
  }

  @override
  List<BlocProvider> onCreateBlocProviders(BuildContext context) {
    return [
      BlocProvider<MeasurementSystemBloc>(
        create: (BuildContext context) => getIt(),
      )
    ];
  }
}
