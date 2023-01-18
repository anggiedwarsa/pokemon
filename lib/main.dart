import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon/app.dart';
import 'package:pokemon/config/base_url_config.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/core/util/styles/colors.dart';
import 'package:pokemon/injection_container.dart' as di;

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();

    const baseUrl = BaseUrlConfig.baseUrlApiEndpoint;
    await di.init();
    di.sl.allowReassignment = true;

    const baseUrlEndpoint = baseUrl;

    FlavorConfig(
      flavor: Flavor.PRODUCTION,
      colorPrimary: BaseColor.materialcolor,
      colorAccent: BaseColor.materialcolorAccent,
      values: FlavorValues(
        baseUrlRootWeb: BaseUrlConfig.baseUrlRootEndpoint,
        baseUrlEndpoint: baseUrlEndpoint,
      ),
    );

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
      (_) => runApp(
        EasyLocalization(
          supportedLocales: const [Locale('id', 'ID')],
          path: 'assets/translations',
          fallbackLocale: const Locale('id', 'ID'),
          child: const App(),
        ),
      ),
    );
  }, (exception, stackTrace) async {});
}
