import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/presentation/bloc/detail_pokemon/detail_pokemon_bloc.dart';

void main() {
  group('DetailPokemonInitial', () {
    final tInitial = DetailPokemonInitial();

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tInitial.props,
          [],
        );
      },
    );

    test(
      'make sure toString value',
      () async {
        // assert
        expect(
          tInitial.toString(),
          'DetailPokemonInitial()',
        );
      },
    );
  });

  group('DetailPokemonLoadingState', () {
    final tLoadingState = DetailPokemonLoadingState();

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tLoadingState.props,
          [],
        );
      },
    );

    test(
      'make sure toString value',
      () async {
        // assert
        expect(
          tLoadingState.toString(),
          'DetailPokemonLoadingState()',
        );
      },
    );
  });

  group('DetailPokemonLoadedState', () {
    final tLoadedState = DetailPokemonLoadedState(
      detailPokemonResponse: DetailPokemonResponse(),
    );

    test(
      'make sure props value',
      () async {
        // assert
        expect(tLoadedState.props, [
          tLoadedState.detailPokemonResponse,
        ]);
      },
    );

    test(
      'make sure toString value',
      () async {
        // assert
        expect(
          tLoadedState.toString(),
          'DetailPokemonLoadedState{detailPokemonResponse: ${tLoadedState.detailPokemonResponse}}',
        );
      },
    );
  });

  group('DetailPokemonFailureState', () {
    final tFailureState = DetailPokemonFailureState(
      errorMessage: 'tErrorMessage',
    );

    test(
      'make sure props value',
      () async {
        // assert
        expect(tFailureState.props, [
          tFailureState.errorMessage,
        ]);
      },
    );

    test(
      'make sure toString value',
      () async {
        // assert
        expect(
          tFailureState.toString(),
          'DetailPokemonFailureState{errorMessage: ${tFailureState.errorMessage}}',
        );
      },
    );
  });
}
