import 'package:flutter/material.dart';
import 'package:ps_pedometer/core/assets/fonts.gen.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';
import 'package:ps_pedometer/core/styles/spacing.dart';
import 'package:ps_pedometer/core/styles/styles.dart';

abstract class BaseTheme {
  ThemeData get() {
    final ThemeData themeData = createTheme();
    return themeData.copyWith(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      textButtonTheme: textButtonThemeData,
      listTileTheme: listTileThemeData,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
      checkboxTheme: checkboxThemeData,
      radioTheme: radioThemeData,
      buttonTheme: ButtonThemeData(height: Styles.minButtonSize.height),
      textTheme: themeData.textTheme.apply(
        fontFamily: FontFamily.sourceSansPro,
      ),
      appBarTheme: themeData.appBarTheme.copyWith(
        centerTitle: false,
        titleSpacing: Spacing.spacing16,
        elevation: 0,
        titleTextStyle: Styles.heading1.merge(
          themeData.appBarTheme.titleTextStyle
              ?.copyWith(fontFamily: FontFamily.sourceSansPro),
        ),
        toolbarHeight: 68,
      ),
      colorScheme: themeData.colorScheme.copyWith(error: AppColors.darkRed),
    );
  }

  ThemeData createTheme();

  final TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: Styles.textButton,
  );

  final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: Styles.elevatedButton,
  );

  final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: Styles.outlinedButton,
  );

  final RadioThemeData radioThemeData = RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.gray500;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.orange;
      }
      return AppColors.gray900;
    }),
  );

  final CheckboxThemeData checkboxThemeData = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.white),
    fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return AppColors.gray500;
      }
      if (states.contains(MaterialState.selected)) {
        return AppColors.orange;
      }
      return AppColors.gray900;
    }),
  );

  AppBarTheme appBarTheme({
    required Color backgroundColor,
    required Color titleColor,
    required Color appBarIconColors,
  }) =>
      AppBarTheme(
        iconTheme: IconThemeData(
          color: appBarIconColors,
        ),
        actionsIconTheme: IconThemeData(
          color: appBarIconColors,
          size: 24,
        ),
        backgroundColor: backgroundColor,
        titleTextStyle: Styles.heading1.copyWith(color: titleColor),
      );

  InputDecorationTheme inputDecorationTheme({
    required Color focusedBorderColor,
    required Color fillColor,
  }) =>
      InputDecorationTheme(
        errorMaxLines: 2,
        fillColor: fillColor,
        hintStyle: Styles.body1.copyWith(color: AppColors.gray700),
        errorStyle: Styles.description,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.gray500, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.gray500, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.gray500, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 2),
          borderRadius: BorderRadius.circular(8.0),
        ),
      );

  BottomNavigationBarThemeData bottomNavigationBarThemeData({
    required Color backgroundColor,
    required Color selectedItemColor,
    required Color unselectedItemColor,
  }) =>
      BottomNavigationBarThemeData(
        backgroundColor: backgroundColor,
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
        selectedIconTheme: IconThemeData(color: selectedItemColor),
        unselectedIconTheme: IconThemeData(color: unselectedItemColor),
        selectedLabelStyle: Styles.description.copyWith(
          fontWeight: FontWeight.w600,
          color: selectedItemColor,
        ),
        unselectedLabelStyle: Styles.description.copyWith(
          fontWeight: FontWeight.w600,
          color: unselectedItemColor,
        ),
      );

  final TextSelectionThemeData textSelectionThemeDataLight =
      const TextSelectionThemeData(
    cursorColor: AppColors.black,
  );

  final TextSelectionThemeData textSelectionThemeDataDark =
      const TextSelectionThemeData(
    cursorColor: AppColors.white,
  );

  final ListTileThemeData listTileThemeData = const ListTileThemeData(
    horizontalTitleGap: 0,
  );
}
