part of 'detail_pokemon_bloc.dart';

abstract class DetailPokemonEvent extends Equatable {
  const DetailPokemonEvent();
}

class LoadDetailPokemonEvent extends DetailPokemonEvent {
  final String? name;

  LoadDetailPokemonEvent({
    this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];

  @override
  String toString() {
    return 'LoadDetailPokemonEvent{name: $name}';
  }
}
