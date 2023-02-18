import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/presentation/bloc/list_pokemons/list_pokemons_bloc.dart';

void main() {
  group('LoadListPokemonsEvent', () {
    final tEvent = LoadListPokemonsEvent();

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tEvent.props,
          [
            tEvent.offset,
            tEvent.limit,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tEvent.toString(),
          'LoadListPokemonsEvent{offset: ${tEvent.offset}, limit: ${tEvent.limit}}',
        );
      },
    );
  });
}
