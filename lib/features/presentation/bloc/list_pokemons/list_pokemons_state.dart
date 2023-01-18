part of 'list_pokemons_bloc.dart';

abstract class ListPokemonsState extends Equatable {
  const ListPokemonsState();

  @override
  List<Object?> get props => [];
}

class ListPokemonsInitial extends ListPokemonsState {}

class ListPokemonsLoadingState extends ListPokemonsState {}

class ListPokemonsLoadedState extends ListPokemonsState {
  final DataPage<ResultResponse> listPokemons;

  ListPokemonsLoadedState({
    required this.listPokemons,
  });

  @override
  List<Object?> get props => [
        listPokemons,
      ];

  @override
  String toString() {
    return 'ListPokemonsLoadedState{listPokemons: $listPokemons}';
  }
}

class ListPokemonsFailureState extends ListPokemonsState {
  final String? errorMessage;

  ListPokemonsFailureState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        errorMessage,
      ];

  @override
  String toString() {
    return 'ListPokemonsFailureState{errorMessage: $errorMessage}';
  }
}
