import 'package:flutter/material.dart';

class BaseColor {
  // Legacy
  static const Color primaryColor = Color(0xFFF7E8CB);
  static const Color secondaryColor = Color(0xFFFF86EC);
  static const Color onDarkPrimary = Color(0xFFDBBF8D);
  static const Color errorColor = Color(0xFFD70825);
  static const Color errorBGColor = Color(0xFFFEEBED);
  static const Color successColor = Color(_materialcolorPrimaryValue);
  static const Color successBGColor = Color(0xFFFFF5FE);
  static const Color iblColor = Color(0xFFC83F79);
  static const Color oversColor = Color(0xFF303486);
  static const Color asiaColor = Color(0xFF9BA647);

  // Design Theme color palette
  static const Color primary50 = Color(0xFFFEFCF9);
  static const Color primary100 = Color(0xFFFDF8EF);
  static const Color primary200 = Color(0xFFFBF4E5);
  static const Color primary300 = Color(0xFFF9EFDB);
  static const Color primary400 = Color(0xFFF8EBD3);
  static const Color primary500 = primaryColor;
  static const Color primary600 = Color(0xFFF6E5C6);
  static const Color primary700 = Color(0xFFF5E2BE);
  static const Color primary800 = Color(0xFFF3DEB8);
  static const Color primary900 = Color(0xFFF1D8AC);

  static const MaterialColor materialcolor = MaterialColor(_materialcolorPrimaryValue, <int, Color>{
    50: Color(0xFFFEE6E6),
    100: Color(0xFFFDBFBF),
    200: Color(0xFFFC9595),
    300: Color(0xFFFB6B6B),
    400: Color(0xFFFA4B4B),
    500: Color(_materialcolorPrimaryValue),
    600: Color(0xFFF82626),
    700: Color(0xFFF72020),
    800: Color(0xFFF61A1A),
    900: Color(0xFFF51010),
  });
  static const int _materialcolorPrimaryValue = 0xFFF92B2B;

  static const MaterialColor materialcolorAccent = MaterialColor(_materialcolorAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_materialcolorAccentValue),
    400: Color(0xFFFFBBBB),
    700: Color(0xFFFFA1A1),
  });
  static const int _materialcolorAccentValue = 0xFFFFEEEE;
}
