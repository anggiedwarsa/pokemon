import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/presentation/bloc/detail_pokemon/detail_pokemon_bloc.dart';

void main() {
  group('LoadDetailPokemonEvent', () {
    final tEvent = LoadDetailPokemonEvent();

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tEvent.props,
          [
            tEvent.name,
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
          'LoadDetailPokemonEvent{name: ${tEvent.name}}',
        );
      },
    );
  });
}
