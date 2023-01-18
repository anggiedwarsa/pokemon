part of 'detail_pokemon_bloc.dart';

abstract class DetailPokemonState extends Equatable {
  const DetailPokemonState();

  @override
  List<Object?> get props => [];
}

class DetailPokemonInitial extends DetailPokemonState {}

class DetailPokemonLoadingState extends DetailPokemonState {}

class DetailPokemonLoadedState extends DetailPokemonState {
  final DetailPokemonResponse detailPokemonResponse;

  DetailPokemonLoadedState({
    required this.detailPokemonResponse,
  });

  @override
  List<Object?> get props => [
        detailPokemonResponse,
      ];

  @override
  String toString() {
    return 'DetailPokemonLoadedState{detailPokemonResponse: $detailPokemonResponse}';
  }
}

class DetailPokemonFailureState extends DetailPokemonState {
  final String? errorMessage;

  DetailPokemonFailureState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [
        errorMessage,
      ];

  @override
  String toString() {
    return 'DetailPokemonFailureState{errorMessage: $errorMessage}';
  }
}
