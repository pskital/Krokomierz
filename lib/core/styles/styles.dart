import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ps_pedometer/core/styles/app_colors.dart';

class Styles {
  Styles._();

  static const Size minButtonSize = Size(48, 48);

  static const TextStyle heading1 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle heading4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.none,
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle body3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle description = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  static TextStyle detailsLabel = Styles.label.copyWith(
    fontWeight: FontWeight.w400,
    color: AppColors.gray700,
    letterSpacing: 0.2,
  );

  static ButtonStyle textButton = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 10),
    ),
    minimumSize: MaterialStateProperty.all(minButtonSize),
    foregroundColor: MaterialStateProperty.all(AppColors.orange),
    textStyle: MaterialStateProperty.all(Styles.buttonText),
    splashFactory: NoSplash.splashFactory,
    overlayColor: MaterialStateProperty.all(Colors.transparent),
  );

  static ButtonStyle elevatedButton = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 10),
    ),
    backgroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.gray300;
        }
        return AppColors.orange;
      },
    ),
    overlayColor: MaterialStateProperty.all(AppColors.orange900),
    minimumSize: MaterialStateProperty.all(minButtonSize),
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return AppColors.gray600;
        }
        return AppColors.white;
      },
    ),
    textStyle: MaterialStateProperty.all(Styles.buttonText),
    elevation: MaterialStateProperty.all(0),
    shadowColor: MaterialStateProperty.all(Colors.transparent),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    splashFactory: NoSplash.splashFactory,
  );

  static ButtonStyle outlinedButton = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 10),
    ),
    overlayColor: MaterialStateProperty.all(Colors.transparent),
    minimumSize: MaterialStateProperty.all(minButtonSize),
    foregroundColor: MaterialStateProperty.all(AppColors.orange),
    textStyle: MaterialStateProperty.all(Styles.buttonText),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: AppColors.orange,
        width: 1.5,
      ),
    ),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  static SystemUiOverlayStyle systemOverlayStyle({
    required Brightness brightness,
    required Color statusBarColor,
  }) {
    return SystemUiOverlayStyle(
      statusBarBrightness: brightness,
      statusBarIconBrightness: brightness,
      statusBarColor: statusBarColor,
    );
  }
}
