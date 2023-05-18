import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/assets/assets.gen.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.title,
    required this.leadingImage,
    required this.onTapItem,
    required this.details,
  });

  final AssetGenImage leadingImage;
  final Function onTapItem;
  final String title;
  final String details;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapItem(),
      child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.body1,
                  ),
                  Text(
                    details,
                    style: Styles.body3.copyWith(color: AppColors.gray800),
                  ),
                ],
              ),
            ),
            const Center(child: Icon(Icons.keyboard_arrow_right))
          ],
        ),
      ),
    );
  }
}
