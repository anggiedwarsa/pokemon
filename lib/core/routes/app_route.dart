import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/presentation/pages/dashboard/dashboard_page.dart';
import 'package:pokemon/features/presentation/pages/pokemon/detail/detail_pokemon_page.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case DashboardPage.routeName:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DashboardPage(),
        );
      case DetailPokemonPage.routeName:
        final arguments = settings.arguments as Map<String, dynamic>;
        final pokemon = arguments['pokemon'] as DetailPokemonResponse;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => DetailPokemonPage(
            detailPokemonResponse: pokemon,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Text('page_not_found'.tr()),
            ),
          ),
        );
    }
  }
}
