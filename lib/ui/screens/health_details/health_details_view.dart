import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/ui/screens/health_details/health_details_list.dart';

class HealthDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.settings.basicData),
      ),
      body: HealthDetailsList(),
    );
  }
}
