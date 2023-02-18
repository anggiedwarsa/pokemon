import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/presentation/bloc/list_pokemons/list_pokemons_bloc.dart';

void main() {
  group('ListPokemonsInitial', () {
    final tInitial = ListPokemonsInitial();

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
          'ListPokemonsInitial()',
        );
      },
    );
  });

  group('ListPokemonsLoadingState', () {
    final tLoadingState = ListPokemonsLoadingState();

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
          'ListPokemonsLoadingState()',
        );
      },
    );
  });

  group('ListPokemonsLoadedState', () {
    final tLoadedState = ListPokemonsLoadedState(
      listPokemons: DataPage<ResultResponse>(),
    );

    test(
      'make sure props value',
      () async {
        // assert
        expect(tLoadedState.props, [
          tLoadedState.listPokemons,
        ]);
      },
    );

    test(
      'make sure toString value',
      () async {
        // assert
        expect(
          tLoadedState.toString(),
          'ListPokemonsLoadedState{listPokemons: ${tLoadedState.listPokemons}}',
        );
      },
    );
  });

  group('ListPokemonsFailureState', () {
    final tFailureState = ListPokemonsFailureState(
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
          'ListPokemonsFailureState{errorMessage: ${tFailureState.errorMessage}}',
        );
      },
    );
  });
}
