import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/core/routes/app_route.dart';
import 'package:pokemon/core/util/styles/colors.dart';
import 'package:pokemon/features/presentation/pages/dashboard/dashboard_page.dart';

final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class App extends StatefulWidget {
  const App({
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void _hideSoftKeyboard(BuildContext context) {
    var currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) => MaterialApp(
        scaffoldMessengerKey: rootScaffoldMessengerKey,
        debugShowCheckedModeBanner: FlavorConfig.isDevelopment(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: BaseColor.materialcolor,
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: FlavorConfig.instance!.colorAccent),
            ),
          ),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: FlavorConfig.instance?.colorAccent,
          ),
        ),
        title: FlavorConfig.isDevelopment() ? 'Dev Pokemons' : 'Pokemons',
        home: const DashboardPage(),
        onGenerateRoute: (settings) => AppRoute.generateRoute(settings),
        builder: (context, child) {
          return GestureDetector(
            onTap: () {
              if (Platform.isIOS) {
                _hideSoftKeyboard(context);
              }
            },
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child ?? Container(),
            ),
          );
        },
      ),
    );
  }
}
