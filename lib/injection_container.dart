import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pokemon/core/service/network_info.dart';
import 'package:pokemon/core/util/dio_logging_interceptor.dart';
import 'package:pokemon/core/util/helper.dart';
import 'package:pokemon/core/util/shared_preferences_manager.dart';
import 'package:pokemon/features/data/data_sources/pokemons_remote_data_sources.dart';
import 'package:pokemon/features/data/repositories/pokemons/pokemons_repository_impl.dart';
import 'package:pokemon/features/domain/repositories/pokemons/pokemons_repository.dart';
import 'package:pokemon/features/domain/use_cases/get_detail_pokemon/get_detail_pokemon.dart';
import 'package:pokemon/features/domain/use_cases/get_list_pokemons/get_list_pokemons.dart';
import 'package:pokemon/features/presentation/bloc/detail_pokemon/detail_pokemon_bloc.dart';
import 'package:pokemon/features/presentation/bloc/list_pokemons/list_pokemons_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /**
   * ! Features
   */

  // Bloc
  sl.registerFactory(
    () => ListPokemonsBloc(
      getListPokemons: sl(),
    ),
  );
  sl.registerFactory(
    () => DetailPokemonBloc(
      getDetailPokemon: sl(),
    ),
  );

  // Remote Data Sources
  sl.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(
      dio: sl(),
    ),
  );

  // Use case
  sl.registerLazySingleton(() => GetListPokemons(
        repository: sl(),
      ));
  sl.registerLazySingleton(() => GetDetailPokemon(
        repository: sl(),
      ));

  // Repository
  sl.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  /**
   * ! Core
   */
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /**
   * ! External
   */
  final sharedPreferences = await SharedPreferences.getInstance();
  final sharedPreferencesManager = SharedPreferencesManager.getInstance(sharedPreferences);
  sl.registerLazySingleton(() => sharedPreferencesManager);
  sl.registerLazySingleton(() {
    final options = BaseOptions(
      connectTimeout: 20 * 1000, //20 seconds
      receiveTimeout: 20 * 1000,
    );
    final dio = Dio(options);
    dio.interceptors.add(DioLoggingInterceptor(dio, sharedPreferencesManager));
    return dio;
  });

  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(
    () => Helper(sharedPreferencesManager: sl()),
  );

  sl.registerLazySingleton(() => DeviceInfoPlugin());

  // dao
  // final migrationAppDatabase = MigrationAppDatabase();
  // final database = await $FloorAppDatabase.databaseBuilder('iblasia_database.db').addMigrations(
  //   [
  //     migrationAppDatabase.migration1To2,
  //     migrationAppDatabase.migration2To3,
  //   ],
  // ).build();
  // sl.registerLazySingleton(() => database.panelCompanyDao);
  // sl.registerLazySingleton(() => database.logCallDao);
}
