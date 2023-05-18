import 'package:flutter/material.dart';

@immutable
class ColorTheme extends ThemeExtension<ColorTheme> {
  const ColorTheme({required this.dividerColor});

  final Color? dividerColor;

  @override
  ThemeExtension<ColorTheme> copyWith({Color? dividerColor}) {
    return ColorTheme(
      dividerColor: dividerColor ?? this.dividerColor,
    );
  }

  @override
  ThemeExtension<ColorTheme> lerp(
    covariant ThemeExtension<ColorTheme>? other,
    double t,
  ) {
    if (other is! ColorTheme) {
      return this;
    }
    return ColorTheme(
      dividerColor: Color.lerp(dividerColor, other.dividerColor, t),
    );
  }
}
