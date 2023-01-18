import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/core/use_cases/use_case.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/domain/repositories/pokemons/pokemons_repository.dart';

class GetListPokemons implements UseCase<DataPage<ResultResponse>, ParamsGetListPokemons> {
  final PokemonsRepository repository;

  GetListPokemons({
    required this.repository,
  });

  @override
  Future<Either<Failure, DataPage<ResultResponse>>> call(ParamsGetListPokemons params) async {
    return repository.getListPokemons(
      params.offset ?? '',
      params.limit ?? '',
    );
  }
}

class ParamsGetListPokemons extends Equatable {
  final String? offset;
  final String? limit;

  ParamsGetListPokemons({
    required this.offset,
    required this.limit,
  });

  @override
  List<Object?> get props => [
        offset,
        limit,
      ];

  @override
  String toString() {
    return 'ParamsGetListPokemons{offset: $offset, limit: $limit}';
  }
}
