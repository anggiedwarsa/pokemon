import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/domain/use_cases/get_list_pokemons/get_list_pokemons.dart';

part 'list_pokemons_event.dart';
part 'list_pokemons_state.dart';

class ListPokemonsBloc extends Bloc<ListPokemonsEvent, ListPokemonsState> {
  final GetListPokemons getListPokemons;

  ListPokemonsBloc({
    required this.getListPokemons,
  }) : super(ListPokemonsInitial()) {
    on<LoadListPokemonsEvent>(_onLoadListPokemonsEvent);
  }

  FutureOr<void> _onLoadListPokemonsEvent(
    LoadListPokemonsEvent event,
    Emitter<ListPokemonsState> emit,
  ) async {
    emit(ListPokemonsLoadingState());

    var resultListPokemons = await getListPokemons(ParamsGetListPokemons(
      offset: event.offset,
      limit: event.limit,
    ));

    emit(
      resultListPokemons.fold(
        (failure) {
          var errorMessage = '';
          if (failure is ServerFailure) {
            errorMessage = failure.dataApiFailure.message ?? errorMessage;
          } else if (failure is ConnectionFailure) {
            errorMessage = failure.errorMessage;
          } else if (failure is ParsingFailure) {
            errorMessage = failure.errorMessage;
          }
          return ListPokemonsFailureState(
            errorMessage: errorMessage,
          );
        },
        (response) => ListPokemonsLoadedState(
          listPokemons: response,
        ),
      ),
    );
  }
}
