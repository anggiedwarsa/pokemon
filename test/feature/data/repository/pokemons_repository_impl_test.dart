import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/data/repositories/pokemons/pokemons_repository_impl.dart';

import '../../../helper/mock_helper.mocks.dart';

void main() {
  late PokemonsRepositoryImpl repositoryImpl;
  late MockPokemonsRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockPokemonsRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repositoryImpl = PokemonsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  final tRequestOptions = RequestOptions(path: '');

  void setUpMockNetworkConnected() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  }

  void setUpMockNetworkDisconnected() {
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
  }

  void testDisconnected(Function endpointInvoke) {
    test(
      'make sure return ConnectionFailure when device is not connected to internet',
      () async {
        // arrange
        setUpMockNetworkDisconnected();

        // act
        final result = await endpointInvoke.call();

        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, Left(ConnectionFailure()));
      },
    );
  }

  void testServerFailureString(Function whenInvoke, Function actInvoke, Function verifyInvoke) {
    test(
      'make sure return ServerFailure when Repository receives failed response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(whenInvoke.call()).thenThrow(
          DioError(
            requestOptions: tRequestOptions,
            error: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: 'testDataError',
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await actInvoke.call();

        // assert
        verify(verifyInvoke.call());
        expect(
            result,
            Left(ServerFailure(const DataApiFailure(
              message: 'testError',
              httpMessage: 'testError',
              statusCode: 400,
            ))));
      },
    );
  }

  void testParsingFailure(Function whenInvoke, Function actInvoke, Function verifyInvoke) {
    test(
      'make sure return ParsingFailure when RemoteDataSource receives not valid response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(whenInvoke.call()).thenThrow(TypeError());

        // act
        final result = await actInvoke.call();

        // assert
        verify(verifyInvoke.call());
        expect(result, Left(ParsingFailure(TypeError().toString())));
      },
    );
  }

  group('getListPokemons', () {
    final tResponse = DataPage<ResultResponse>();

    test(
      'make sure return sucess value when receieve success response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getListPokemons(any, any)).thenAnswer((_) async => tResponse);

        // act
        final result = await repositoryImpl.getListPokemons('', '');

        // assert
        verify(mockRemoteDataSource.getListPokemons(any, any));
        expect(result, Right(tResponse));
      },
    );

    test(
      'make sure return ServerFailure when response is timeout',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getListPokemons(any, any)).thenThrow(DioError(
          requestOptions: tRequestOptions,
          error: 'testError',
        ));

        // act
        final result = await repositoryImpl.getListPokemons('', '');

        // assert
        verify(mockRemoteDataSource.getListPokemons(any, any));
        expect(
            result,
            Left(ServerFailure(const DataApiFailure(
              message: 'testError',
            ))));
      },
    );

    test(
      'make sure return ServerFailure when failed response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getListPokemons(any, any)).thenThrow(
          DioError(
            requestOptions: tRequestOptions,
            error: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: {
                'title': 'testTitleError',
                'message': 'testMessageError',
                'errors': {'testError': []},
              },
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await repositoryImpl.getListPokemons('', '');

        // assert
        verify(mockRemoteDataSource.getListPokemons(any, any));
        expect(
            result,
            Left(ServerFailure(const DataApiFailure(
              statusCode: 400,
              httpMessage: 'testError',
              message: '400 testMessageError',
              errorData: {'testError': []},
            ))));
      },
    );

    testServerFailureString(
      () => mockRemoteDataSource.getListPokemons(any, any),
      () => repositoryImpl.getListPokemons('', ''),
      () => mockRemoteDataSource.getListPokemons('', ''),
    );

    testParsingFailure(
      () => mockRemoteDataSource.getListPokemons(any, any),
      () => repositoryImpl.getListPokemons('', ''),
      () => mockRemoteDataSource.getListPokemons('', ''),
    );

    testDisconnected(() => repositoryImpl.getListPokemons('', ''));
  });

  group('getDetailPokemon', () {
    final tName = 'pokemon';
    final tResponse = DetailPokemonResponse();

    test(
      'make sure return sucess value when receieve success response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getDetailPokemon(any)).thenAnswer((_) async => tResponse);

        // act
        final result = await repositoryImpl.getDetailPokemon(tName);

        // assert
        verify(mockRemoteDataSource.getDetailPokemon(any));
        expect(result, Right(tResponse));
      },
    );

    test(
      'make sure return ServerFailure when response is timeout',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getDetailPokemon(any)).thenThrow(DioError(
          requestOptions: tRequestOptions,
          error: 'testError',
        ));

        // act
        final result = await repositoryImpl.getDetailPokemon(tName);

        // assert
        verify(mockRemoteDataSource.getDetailPokemon(any));
        expect(
            result,
            Left(ServerFailure(const DataApiFailure(
              message: 'testError',
            ))));
      },
    );

    test(
      'make sure return ServerFailure when failed response from endpoint',
      () async {
        // arrange
        setUpMockNetworkConnected();
        when(mockRemoteDataSource.getDetailPokemon(any)).thenThrow(
          DioError(
            requestOptions: tRequestOptions,
            error: 'testError',
            response: Response(
              requestOptions: tRequestOptions,
              data: {
                'title': 'testTitleError',
                'message': 'testMessageError',
                'errors': {'testError': []},
              },
              statusCode: 400,
            ),
          ),
        );

        // act
        final result = await repositoryImpl.getDetailPokemon(tName);

        // assert
        verify(mockRemoteDataSource.getDetailPokemon(any));
        expect(
            result,
            Left(ServerFailure(const DataApiFailure(
              statusCode: 400,
              httpMessage: 'testError',
              message: '400 testMessageError',
              errorData: {'testError': []},
            ))));
      },
    );

    testServerFailureString(
      () => mockRemoteDataSource.getDetailPokemon(any),
      () => repositoryImpl.getDetailPokemon(tName),
      () => mockRemoteDataSource.getDetailPokemon(tName),
    );

    testParsingFailure(
      () => mockRemoteDataSource.getDetailPokemon(any),
      () => repositoryImpl.getDetailPokemon(tName),
      () => mockRemoteDataSource.getDetailPokemon(tName),
    );

    testDisconnected(() => repositoryImpl.getDetailPokemon(tName));
  });
}
