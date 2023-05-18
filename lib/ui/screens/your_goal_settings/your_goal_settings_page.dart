import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps_pedometer/bloc/your_goal_settings/your_goal_settings_bloc.dart';
import 'package:ps_pedometer/data/injection/injection.dart';
import 'package:ps_pedometer/ui/screens/base_page.dart';
import 'package:ps_pedometer/ui/screens/your_goal_settings/your_goal_settings_view.dart';

class YourGoalSettingsPage extends BasePage {
  @override
  Widget onCreateView(BuildContext context) {
    return YourGoalSettingsView();
  }

  @override
  List<BlocProvider> onCreateBlocProviders(BuildContext context) {
    return [
      BlocProvider<YourGoalSettingsBloc>(
        create: (_) {
          return getIt();
        },
      )
    ];
  }
}
