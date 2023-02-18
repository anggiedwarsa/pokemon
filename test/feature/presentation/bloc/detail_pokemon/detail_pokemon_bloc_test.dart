import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/presentation/bloc/detail_pokemon/detail_pokemon_bloc.dart';

import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late MockGetDetailPokemon mockGetDetailPokemon;
  late DetailPokemonBloc bloc;

  setUp(() {
    mockGetDetailPokemon = MockGetDetailPokemon();
    bloc = DetailPokemonBloc(
      getDetailPokemon: mockGetDetailPokemon,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test(
    'make sure iniitialState adalah DetailPokemonInitial',
    () async {
      // assert
      expect(
        bloc.state,
        DetailPokemonInitial(),
      );
    },
  );

  group('Load Detail Pokemon', () {
    final tDetailPokemonResponse = DetailPokemonResponse();

    blocTest(
      'make sure emit [DetailPokemonLoadingState, DetailPokemonLoadedState] when receive LoadDetailPokemonEvent with success response',
      build: () {
        when(mockGetDetailPokemon(any)).thenAnswer((_) async => Right(tDetailPokemonResponse));
        return bloc;
      },
      act: (DetailPokemonBloc bloc) => bloc.add(LoadDetailPokemonEvent()),
      expect: () => [
        DetailPokemonLoadingState(),
        DetailPokemonLoadedState(
          detailPokemonResponse: tDetailPokemonResponse,
        ),
      ],
    );

    blocTest(
      'make sure emit [DetailPokemonLoadingState, DetailPokemonFailureState] when receive LoadDetailPokemonEvent with failed response from API',
      build: () {
        when(mockGetDetailPokemon(any)).thenAnswer((_) async => Left(ServerFailure(const DataApiFailure(
              message: 'testErrorMessage',
            ))));
        return bloc;
      },
      act: (DetailPokemonBloc bloc) => bloc.add(LoadDetailPokemonEvent()),
      expect: () => [
        DetailPokemonLoadingState(),
        DetailPokemonFailureState(
          errorMessage: 'testErrorMessage',
        ),
      ],
    );

    blocTest(
      'make sure emit [DetailPokemonLoadingState, DetailPokemonFailureState] when receive LoadDetailPokemonEvent when internet not connected',
      build: () {
        when(mockGetDetailPokemon(any)).thenAnswer((_) async => Left(ConnectionFailure()));
        return bloc;
      },
      act: (DetailPokemonBloc bloc) {
        return bloc.add(LoadDetailPokemonEvent());
      },
      expect: () => [
        DetailPokemonLoadingState(),
        DetailPokemonFailureState(
          errorMessage: 'messageConnectionFailure',
        ),
      ],
    );

    blocTest(
      'make sure emit [DetailPokemonLoadingState, DetailPokemonFailureState] when receive LoadDetailPokemonEvent with failed parsing json from API',
      build: () {
        when(mockGetDetailPokemon(any)).thenAnswer((_) async => Left(ParsingFailure('testErrorMessage')));
        return bloc;
      },
      act: (DetailPokemonBloc bloc) {
        return bloc.add(LoadDetailPokemonEvent());
      },
      expect: () => [
        DetailPokemonLoadingState(),
        DetailPokemonFailureState(
          errorMessage: 'testErrorMessage',
        ),
      ],
    );
  });
}
