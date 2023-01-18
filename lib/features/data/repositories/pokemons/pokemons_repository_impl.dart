import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/service/network_info.dart';
import 'package:pokemon/features/data/data_sources/pokemons_remote_data_sources.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/domain/repositories/pokemons/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PokemonsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  String getErrorMessageFromEndpoint(dynamic dynamicErrorMessage, String httpErrorMessage, int statusCode) {
    if (dynamicErrorMessage is Map &&
        dynamicErrorMessage.containsKey('message') &&
        dynamicErrorMessage['message'].isNotEmpty) {
      return '$statusCode ${dynamicErrorMessage['message']}';
    } else if (dynamicErrorMessage is String) {
      return httpErrorMessage;
    } else {
      return httpErrorMessage;
    }
  }

  @override
  Future<Either<Failure, DataPage<ResultResponse>>> getListPokemons(String offset, String limit) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var response = await remoteDataSource.getListPokemons(offset, limit);
        return Right(response);
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(ServerFailure(DataApiFailure(
            message: error.message,
          )));
        }
        final errorResponseData = error.response?.data;
        var errorData;
        var errorMessage = getErrorMessageFromEndpoint(
          errorResponseData,
          error.message,
          error.response?.statusCode ?? 400,
        );
        if (errorResponseData is Map && errorResponseData.containsKey('errors')) {
          errorData = errorResponseData['errors'];
        }
        return Left(ServerFailure(DataApiFailure(
          message: errorMessage,
          statusCode: error.response?.statusCode,
          httpMessage: error.message,
          errorData: errorData,
        )));
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, DetailPokemonResponse>> getDetailPokemon(String name) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        var response = await remoteDataSource.getDetailPokemon(name);
        return Right(response);
      } on DioError catch (error) {
        if (error.response == null) {
          return Left(ServerFailure(DataApiFailure(
            message: error.message,
          )));
        }
        final errorResponseData = error.response?.data;
        var errorData;
        var errorMessage = getErrorMessageFromEndpoint(
          errorResponseData,
          error.message,
          error.response?.statusCode ?? 400,
        );
        if (errorResponseData is Map && errorResponseData.containsKey('errors')) {
          errorData = errorResponseData['errors'];
        }
        return Left(ServerFailure(DataApiFailure(
          message: errorMessage,
          statusCode: error.response?.statusCode,
          httpMessage: error.message,
          errorData: errorData,
        )));
      } on TypeError catch (error) {
        return Left(ParsingFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
