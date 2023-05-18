import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/health_details/health_details_bloc.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/ui/screens/base_page.dart';
import 'package:ps_pedometer/ui/screens/health_details/health_details_view.dart';

class HealthDetailsPage extends BasePage {
  @override
  Widget onCreateView(BuildContext context) {
    return HealthDetailsView();
  }

  @override
  List<BlocProvider> onCreateBlocProviders(BuildContext context) {
    return [
      BlocProvider<HealthDetailsBloc>(
        create: (_) {
          return getIt();
        },
      )
    ];
  }
}
