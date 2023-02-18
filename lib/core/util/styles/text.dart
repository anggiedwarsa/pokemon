import 'package:flutter/material.dart';

class BaseTextStyle {
  /// Guideline typografi berdasarkan Material Design type system
  /// https://material.io/design/typography/the-type-system.html#type-scale
  static final TextTheme textThemeBak = TextTheme(
    displayLarge: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
      height: 1.37,
    ),
    displayMedium: TextStyle(
      fontSize: 60,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      height: 1.46,
    ),
    displaySmall: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w400,
      height: 1.41,
      letterSpacing: 0.0,
    ),
    headlineMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.18,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.38,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.5,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.04,
      height: 1.45,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      height: 1.4,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.35,
      color: Color(0xFF919498),
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.24,
      height: 1.2,
      color: Color(0xFF919498),
    ),
  );

  static final TextStyle overline2 = const TextStyle(
    fontSize: 10,
    color: Color(0xFF65707B),
    fontWeight: FontWeight.w400,
    height: 1.20,
    letterSpacing: 0.12,
  );

  static final shadow1 = <Shadow>[
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 8.0,
      color: Colors.black,
    ),
    Shadow(
      offset: Offset(-2.0, 2.0),
      blurRadius: 13.0,
      color: Colors.black,
    ),
    Shadow(
      offset: Offset(0.0, -2.0),
      blurRadius: 13.0,
      color: Colors.black,
    ),
  ];
}
