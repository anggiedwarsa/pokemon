import 'package:dartz/dartz.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';

abstract class PokemonsRepository {
  Future<Either<Failure, DataPage<ResultResponse>>> getListPokemons(String offset, String limit);

  Future<Either<Failure, DetailPokemonResponse>> getDetailPokemon(String name);
}
