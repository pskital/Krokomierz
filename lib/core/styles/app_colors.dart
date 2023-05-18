import 'package:flutter/material.dart';

class AppColors {

  AppColors._();

  //primary
  static const Color orange = Color(0xFFFE5722);
  static const Color black = Color(0xFF222222);
  static const Color black900 = Color(0xFF111111);
  static const Color white = Color(0xFFFFFFFF);
  static const Color progressBackground = Color(0xFF16262D);

  //oranges
  static const Color orange900 = Color(0xFFF43B00);
  static const Color orange600 = Color(0xFFFE8964);
  static const Color orange300 = Color(0xFFFFCEBD);
  static const Color orange200 = Color(0xFFFFE8E0);
  static const Color orange100 = Color(0xFFFFF2ED);

  //grays
  static const Color gray900 = Color(0xFF6A7076);
  static const Color gray800 = Color(0xFF788087);
  static const Color gray700 = Color(0xFF8A929A);
  static const Color gray600 = Color(0xFFB0B6BC);
  static const Color gray500 = Color(0xFFC9CCCE);
  static const Color gray400 = Color(0xFFDBDBDB);
  static const Color gray300 = Color(0xFFE9E9E9);
  static const Color gray200 = Color(0xFFF4F4F4);
  static const Color gray100 = Color(0xFFF9F9F9);

  static const Color success = Color(0xFF007D50);
  static const Color greenLight = Color(0xFF4F9C01);
  static const Color darkRed = Color(0xFF951B00);
  static const Color yellowAccent = Color(0xFFFFD600);
  static const Color yellowDark = Color(0xFF9A8200);
  static const Color blue = Color(0xFF02499C);
  static const Color violet = Color(0xFF9900BF);
  static const Color transparent = Color(0x00FFFFFF);

  static const LinearGradient linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFFE5722), Color(0xFFEA8C4B)],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(0.5, 0.0),
    stops: <double>[0.0, 1.0],
    tileMode: TileMode.clamp,
  );
}
