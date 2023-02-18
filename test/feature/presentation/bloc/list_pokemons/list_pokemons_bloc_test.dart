import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/presentation/bloc/list_pokemons/list_pokemons_bloc.dart';

import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late MockGetListPokemons mockGetListPokemons;
  late ListPokemonsBloc bloc;

  setUp(() {
    mockGetListPokemons = MockGetListPokemons();
    bloc = ListPokemonsBloc(
      getListPokemons: mockGetListPokemons,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test(
    'make sure iniitialState adalah ListPokemonsInitial',
    () async {
      // assert
      expect(
        bloc.state,
        ListPokemonsInitial(),
      );
    },
  );

  group('Load List Pokemons', () {
    final tListPokemonsResponse = DataPage<ResultResponse>();

    blocTest(
      'make sure emit [ListPokemonsLoadingState, ListPokemonsLoadedState] when receive LoadListPokemonsEvent with success response',
      build: () {
        when(mockGetListPokemons(any)).thenAnswer((_) async => Right(tListPokemonsResponse));
        return bloc;
      },
      act: (ListPokemonsBloc bloc) => bloc.add(LoadListPokemonsEvent()),
      expect: () => [
        ListPokemonsLoadingState(),
        ListPokemonsLoadedState(
          listPokemons: tListPokemonsResponse,
        ),
      ],
    );

    blocTest(
      'make sure emit [ListPokemonsLoadingState, ListPokemonsFailureState] when receive LoadListPokemonsEvent with failed response from API',
      build: () {
        when(mockGetListPokemons(any)).thenAnswer((_) async => Left(ServerFailure(const DataApiFailure(
              message: 'testErrorMessage',
            ))));
        return bloc;
      },
      act: (ListPokemonsBloc bloc) => bloc.add(LoadListPokemonsEvent()),
      expect: () => [
        ListPokemonsLoadingState(),
        ListPokemonsFailureState(
          errorMessage: 'testErrorMessage',
        ),
      ],
    );

    blocTest(
      'make sure emit [ListPokemonsLoadingState, ListPokemonsFailureState] when receive LoadListPokemonsEvent when internet not connected',
      build: () {
        when(mockGetListPokemons(any)).thenAnswer((_) async => Left(ConnectionFailure()));
        return bloc;
      },
      act: (ListPokemonsBloc bloc) {
        return bloc.add(LoadListPokemonsEvent());
      },
      expect: () => [
        ListPokemonsLoadingState(),
        ListPokemonsFailureState(
          errorMessage: 'messageConnectionFailure',
        ),
      ],
    );

    blocTest(
      'make sure emit [ListPokemonsLoadingState, ListPokemonsFailureState] when receive LoadListPokemonsEvent with failed parsing json from API',
      build: () {
        when(mockGetListPokemons(any)).thenAnswer((_) async => Left(ParsingFailure('testErrorMessage')));
        return bloc;
      },
      act: (ListPokemonsBloc bloc) {
        return bloc.add(LoadListPokemonsEvent());
      },
      expect: () => [
        ListPokemonsLoadingState(),
        ListPokemonsFailureState(
          errorMessage: 'testErrorMessage',
        ),
      ],
    );
  });
}
