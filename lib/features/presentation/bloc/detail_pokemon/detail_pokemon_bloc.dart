import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/domain/use_cases/get_detail_pokemon/get_detail_pokemon.dart';

part 'detail_pokemon_event.dart';
part 'detail_pokemon_state.dart';

class DetailPokemonBloc extends Bloc<DetailPokemonEvent, DetailPokemonState> {
  final GetDetailPokemon getDetailPokemon;

  DetailPokemonBloc({
    required this.getDetailPokemon,
  }) : super(DetailPokemonInitial()) {
    on<LoadDetailPokemonEvent>(_onLoadDetailPokemonEvent);
  }

  FutureOr<void> _onLoadDetailPokemonEvent(
    LoadDetailPokemonEvent event,
    Emitter<DetailPokemonState> emit,
  ) async {
    emit(DetailPokemonInitial());
    emit(DetailPokemonLoadingState());

    var resultDetailPokemon = await getDetailPokemon(ParamsGetDetailPokemon(
      name: event.name,
    ));

    emit(
      resultDetailPokemon.fold(
        (failure) {
          var errorMessage = '';
          if (failure is ServerFailure) {
            errorMessage = failure.dataApiFailure.message ?? errorMessage;
          } else if (failure is ConnectionFailure) {
            errorMessage = failure.errorMessage;
          } else if (failure is ParsingFailure) {
            errorMessage = failure.errorMessage;
          }
          return DetailPokemonFailureState(
            errorMessage: errorMessage,
          );
        },
        (response) => DetailPokemonLoadedState(
          detailPokemonResponse: response,
        ),
      ),
    );
  }
}
