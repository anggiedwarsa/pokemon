import 'package:flutter/material.dart';

enum Flavor {
  DEVELOPMENT,
  PRODUCTION,
  KUBERNETES,
}

class FlavorValues {
  String baseUrlEndpoint;
  String baseUrlRootWeb;

  FlavorValues({
    required this.baseUrlEndpoint,
    required this.baseUrlRootWeb,
  });
}

class FlavorConfig {
  final Flavor? flavor;
  final String name;
  final MaterialColor colorPrimary;
  final Color colorPrimaryDark;
  final Color colorPrimaryLight;
  final Color colorAccent;
  final FlavorValues? values;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    @required Flavor? flavor,
    MaterialColor colorPrimary = Colors.orange,
    Color colorPrimaryDark = Colors.orange,
    Color colorPrimaryLight = Colors.orange,
    Color colorAccent = Colors.orangeAccent,
    @required FlavorValues? values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      enumName(flavor.toString()),
      colorPrimary,
      colorPrimaryDark,
      colorPrimaryLight,
      colorAccent,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(
    this.flavor,
    this.name,
    this.colorPrimary,
    this.colorPrimaryDark,
    this.colorPrimaryLight,
    this.colorAccent,
    this.values,
  );

  static FlavorConfig? get instance {
    return _instance;
  }

  static String enumName(String enumToString) {
    var paths = enumToString.split('.');
    return paths[paths.length - 1];
  }

  static bool isProduction() => _instance?.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEVELOPMENT;
}
