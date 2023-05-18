import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
  });

  final T value;
  final T? groupValue;
  final String text;
  final ValueChanged<T?> onChanged;

  Widget _buildButton() {
    final bool isSelected = value == groupValue;
    return Container(
      width: 22,
      height: 22,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: isSelected ? AppColors.orange : AppColors.gray900,
          ),
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const ShapeDecoration(
                  shape: CircleBorder(),
                  color: AppColors.orange,
                ),
              ),
            )
          : Container(),
    );
  }

  Widget _buildText() {
    final bool isSelected = value == groupValue;
    return Text(
      text,
      style: Styles.body1.copyWith(
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
        height: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: Spacing.spacing16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildButton(),
            const SizedBox(width: 17),
            _buildText(),
          ],
        ),
      ),
    );
  }
}
