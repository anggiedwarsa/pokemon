part of 'list_pokemons_bloc.dart';

abstract class ListPokemonsEvent extends Equatable {
  const ListPokemonsEvent();
}

class LoadListPokemonsEvent extends ListPokemonsEvent {
  final String? offset;
  final String? limit;

  LoadListPokemonsEvent({
    this.offset,
    this.limit,
  });

  @override
  List<Object?> get props => [
        offset,
        limit,
      ];

  @override
  String toString() {
    return 'LoadListPokemonsEvent{offset: $offset, limit: $limit}';
  }
}
