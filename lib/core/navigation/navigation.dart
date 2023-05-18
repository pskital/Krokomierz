import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/navigation/routes.dart';
import 'package:ps_pedometer/ui/screens/health_details/health_details_page.dart';
import 'package:ps_pedometer/ui/screens/home/home_page.dart';
import 'package:ps_pedometer/ui/screens/measurement_system_settings/measurement_system_page.dart';
import 'package:ps_pedometer/ui/screens/not_found/not_found_page.dart';
import 'package:ps_pedometer/ui/screens/settings/settings_page.dart';
import 'package:ps_pedometer/ui/screens/your_goal_settings/your_goal_settings_page.dart';

class Navigation {
  Navigation._();

  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case Routes.home:
        page = HomePage();
        break;
      case Routes.settings:
        page = SettingsPage();
        break;
      case Routes.settings_your_goal:
        page = YourGoalSettingsPage();
        break;
      case Routes.settings_measurement_system:
        page = MeasurementSystemPage();
        break;
      case Routes.settings_health_details:
        page = HealthDetailsPage();
        break;
      default:
        page = NotFoundPage();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => page,
      settings: settings,
    );
  }
}
