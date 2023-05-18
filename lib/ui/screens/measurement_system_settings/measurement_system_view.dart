import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/ui/screens/measurement_system_settings/measurement_system_list.dart';

class MeasurementSystemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.settings.measurementSystem),
      ),
      body: MeasurementSystemList(),
    );
  }
}
