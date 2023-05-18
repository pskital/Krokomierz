import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/navigation/routes.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/translations/app_translations_impl.dart';
import 'package:ps_pedometer/ui/screens/home/home_details.dart';
import 'package:ps_pedometer/ui/screens/home/home_step_count_progress_bar.dart';
import 'package:ps_pedometer/ui/screens/home/home_step_count_text_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.home.pedometer),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.only(right: Spacing.spacing8),
            icon: const Icon(Icons.settings),
            onPressed: () => _onSettingsPressed(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                HomeStepCountProgressBar(),
                HomeStepCountText()
              ],
            ),
            const SizedBox(height: 30),
            HomeDetails()
          ],
        ),
      ),
    );
  }

  void _onSettingsPressed(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.settings);
  }
}
