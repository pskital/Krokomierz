import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/assets/assets.gen.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';

typedef OnValueChange = Function(int value);

class SetValueWidget extends StatelessWidget {
  const SetValueWidget({
    required this.onValueChange,
    required this.leadingImage,
    required this.minValue,
    required this.maxValue,
    required this.title,
    required this.modificationValue,
    required this.value,
    this.displayValue,
  });

  final OnValueChange onValueChange;
  final AssetGenImage leadingImage;
  final String? displayValue;
  final String title;
  final int modificationValue;
  final int minValue;
  final int maxValue;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Spacing.spacing12),
      padding: const EdgeInsets.all(Spacing.spacing12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.orange,
              shape: BoxShape.circle,
            ),
            child: leadingImage.image(
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Styles.body1,
            ),
          ),
          GestureDetector(
            onTap: () => _onDecreaseValueTap(),
            child: Container(
              color: Colors.transparent,
              width: 36,
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: AppColors.gray900,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.remove,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Center(
              child: Text(
                '${displayValue ?? value}',
                style: Styles.heading1,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => _onIncreaseValueTap(),
            child: Container(
              color: Colors.transparent,
              width: 36,
              height: 48,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              child: Container(
                height: 24,
                width: 24,
                decoration: const BoxDecoration(
                  color: AppColors.gray900,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDecreaseValueTap() {
    if (value > minValue) {
      onValueChange(value - modificationValue);
    }
  }

  void _onIncreaseValueTap() {
    if (value < maxValue) {
      onValueChange(value + modificationValue);
    }
  }
}
