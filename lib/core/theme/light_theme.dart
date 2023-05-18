import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/styles.dart';
import 'package:ps_pedometer/core/theme/base_theme.dart';
import 'package:ps_pedometer/core/theme/color_theme.dart';

class LightTheme extends BaseTheme {
  @override
  ThemeData createTheme() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.white ,
      inputDecorationTheme: inputDecorationTheme(
        focusedBorderColor: AppColors.black,
        fillColor: AppColors.white,
      ),
      bottomNavigationBarTheme: bottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.gray600,
      ),
      textSelectionTheme: textSelectionThemeDataLight,
      appBarTheme: appBarTheme(
        appBarIconColors: AppColors.black,
        backgroundColor: AppColors.white,
        titleColor: AppColors.black,
      ).copyWith(
        systemOverlayStyle: Styles.systemOverlayStyle(
          brightness: TargetPlatform.iOS == defaultTargetPlatform
              ? Brightness.light
              : Brightness.dark,
          statusBarColor: AppColors.white,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.orange,
        secondary: AppColors.orange,
      ).copyWith(background: AppColors.gray200),
      extensions: const <ThemeExtension<dynamic>>[
        ColorTheme(
          dividerColor: AppColors.gray900,
        ),
      ],
    );
  }
}
