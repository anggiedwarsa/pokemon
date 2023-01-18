import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/use_cases/use_case.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/domain/repositories/pokemons/pokemons_repository.dart';

class GetDetailPokemon implements UseCase<DetailPokemonResponse, ParamsGetDetailPokemon> {
  final PokemonsRepository repository;

  GetDetailPokemon({
    required this.repository,
  });

  @override
  Future<Either<Failure, DetailPokemonResponse>> call(ParamsGetDetailPokemon params) async {
    return repository.getDetailPokemon(params.name ?? '');
  }
}

class ParamsGetDetailPokemon extends Equatable {
  final String? name;

  ParamsGetDetailPokemon({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];

  @override
  String toString() {
    return 'ParamsGetDetailPokemon{name: $name}';
  }
}
