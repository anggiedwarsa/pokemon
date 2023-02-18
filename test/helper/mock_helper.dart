import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:pokemon/core/service/network_info.dart';
import 'package:pokemon/core/util/shared_preferences_manager.dart';
import 'package:pokemon/features/data/data_sources/pokemons_remote_data_sources.dart';
import 'package:pokemon/features/domain/repositories/pokemons/pokemons_repository.dart';
import 'package:pokemon/features/domain/use_cases/get_detail_pokemon/get_detail_pokemon.dart';
import 'package:pokemon/features/domain/use_cases/get_list_pokemons/get_list_pokemons.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  Connectivity,
  SharedPreferences,
  SharedPreferencesManager,
  HttpClientAdapter,
  Dio,
  NetworkInfo,
  PokemonsRemoteDataSource,
  PokemonsRepository,
  GetListPokemons,
  GetDetailPokemon,
])
void main() {}
