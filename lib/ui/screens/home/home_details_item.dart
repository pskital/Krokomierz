import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';

class HomeDetailsItem extends StatelessWidget {
  const HomeDetailsItem({
    required this.title,
    required this.value,
    required this.goalValue,
  });

  final String title;
  final int value;
  final int goalValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.spacing12),
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.spacing12,
        vertical: Spacing.spacing16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: Spacing.spacing8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Styles.heading4,
                ),
                Text(
                  '$value / $goalValue',
                  style: Styles.heading4,
                )
              ],
            ),
          ),
          const SizedBox(height: Spacing.spacing12),
          LinearPercentIndicator(
            barRadius: const Radius.circular(10),
            lineHeight: 20.0,
            percent: 0.5,
            backgroundColor: AppColors.progressBackground,
            progressColor: AppColors.orange,
          ),
        ],
      ),
    );
  }
}
