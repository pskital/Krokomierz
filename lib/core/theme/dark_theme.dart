import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/styles.dart';
import 'package:ps_pedometer/core/theme/base_theme.dart';
import 'package:ps_pedometer/core/theme/color_theme.dart';

class DarkTheme extends BaseTheme {
  @override
  ThemeData createTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.black,
      inputDecorationTheme: inputDecorationTheme(
        focusedBorderColor: AppColors.white,
        fillColor: AppColors.black,
      ),
      bottomNavigationBarTheme: bottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.gray600,
      ),
      textSelectionTheme: textSelectionThemeDataDark,
      disabledColor: AppColors.gray500,
      appBarTheme: appBarTheme(
        appBarIconColors: AppColors.white,
        backgroundColor: AppColors.black,
        titleColor: AppColors.white,
      ).copyWith(
        systemOverlayStyle: Styles.systemOverlayStyle(
          brightness: TargetPlatform.iOS == defaultTargetPlatform
              ? Brightness.dark
              : Brightness.light,
          statusBarColor: AppColors.black,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: AppColors.orange,
        secondary: AppColors.orange,
      ).copyWith(background: AppColors.black900),
      extensions: const <ThemeExtension<dynamic>>[
        ColorTheme(
          dividerColor: AppColors.gray400,
        ),
      ],
    );
  }
}
