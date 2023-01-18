import 'package:dio/dio.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';

abstract class PokemonsRemoteDataSource {
  /// Panggil endpoint [BaseUrlConfig]/v2/pokemon
  ///
  /// Throws [DioError] untuk semua error kode
  Future<DataPage<ResultResponse>> getListPokemons(String offset, String limit);

  /// Panggil endpoint [BaseUrlConfig]/v2/pokemon/{name}
  ///
  /// Throws [DioError] untuk semua error kode
  Future<DetailPokemonResponse> getDetailPokemon(String name);
}

class PokemonsRemoteDataSourceImpl implements PokemonsRemoteDataSource {
  final Dio dio;

  PokemonsRemoteDataSourceImpl({
    required this.dio,
  });

  final baseUrl = FlavorConfig.instance!.values!.baseUrlEndpoint;

  @override
  Future<DataPage<ResultResponse>> getListPokemons(String offset, String limit) async {
    final path = '$baseUrl/v2/pokemon';
    final response = await dio.get(
      path,
      queryParameters: {
        if (offset.isNotEmpty) 'offset': offset,
        if (limit.isNotEmpty) 'limit': limit,
      },
    );
    if (response.statusCode == 200) {
      return DataPage<ResultResponse>.fromJson(response.data, ResultResponse.fromJson);
    } else {
      throw DioError(
          requestOptions: RequestOptions(
        path: path,
      ));
    }
  }

  @override
  Future<DetailPokemonResponse> getDetailPokemon(String name) async {
    final path = '$baseUrl/v2/pokemon/$name';
    final response = await dio.get(
      path,
    );
    if (response.statusCode == 200) {
      return DetailPokemonResponse.fromJson(response.data);
    } else {
      throw DioError(
          requestOptions: RequestOptions(
        path: path,
      ));
    }
  }
}
