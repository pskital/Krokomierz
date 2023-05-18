import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/theme/color_theme.dart';

bool isDarkTheme(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

Color? getBackgroundColor(BuildContext context) {
  return Theme.of(context).extension<ColorTheme>()?.dividerColor;
}
