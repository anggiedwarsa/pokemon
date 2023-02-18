import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/config/base_url_config.dart';
import 'package:pokemon/config/flavor_config.dart';
import 'package:pokemon/features/data/data_sources/pokemons_remote_data_sources.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';

import '../../../fixture/fixture_reader.dart';
import '../../../helper/mock_helper.mocks.dart';

void main() {
  late PokemonsRemoteDataSource remoteDataSource;
  late MockDio mockDio;
  late MockHttpClientAdapter mockDioAdapter;

  final baseUrl = BaseUrlConfig.baseUrlApiEndpoint;
  setUp(() {
    FlavorConfig(
      flavor: Flavor.DEVELOPMENT,
      values: FlavorValues(
        baseUrlEndpoint: '',
        baseUrlRootWeb: '',
      ),
    );
    FlavorConfig.instance!.values!.baseUrlEndpoint = baseUrl;
    mockDio = MockDio();
    mockDioAdapter = MockHttpClientAdapter();
    mockDio.httpClientAdapter = mockDioAdapter;
    remoteDataSource = PokemonsRemoteDataSourceImpl(
      dio: mockDio,
    );
  });

  final tRequestOptions = RequestOptions(path: '');

  group('getListPokemons', () {
    final jsonMap = json.decode(fixture('list_pokemon_response.json'));
    final tResponse = DataPage<ResultResponse>.fromJson(jsonMap, ResultResponse.fromJson);

    void setUpMockDioSuccess() {
      final responsePayload = jsonMap;
      final response = Response(
        requestOptions: tRequestOptions,
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
      );
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => response);
    }

    test(
      'make sure getListPokemons called with method GET',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        await remoteDataSource.getListPokemons('', '');

        // assert
        verify(
          mockDio.get(
            '$baseUrl/v2/pokemon',
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options'),
          ),
        );
      },
    );

    test(
      'make sure returns DataPage<ResultResponse> when response is (200) from endpoint',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await remoteDataSource.getListPokemons('', '');

        // assert
        expect(result, tResponse);
      },
    );

    test(
      'make sure throw exception DioError when returns exception from endpoint',
      () async {
        // arrange
        final response = Response(
          requestOptions: tRequestOptions,
          data: 'Bad Request',
          statusCode: 400,
        );
        when(
          mockDio.get(
            any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options'),
          ),
        ).thenAnswer((_) async => response);

        // act
        final call = remoteDataSource.getListPokemons('', '');

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioError>()));
      },
    );
  });

  group('getDetailPokemon', () {
    final jsonMap = json.decode(fixture('detail_pokemon_response.json'));
    final tName = 'pokemon';
    final tResponse = DetailPokemonResponse.fromJson(jsonMap);

    void setUpMockDioSuccess() {
      final responsePayload = jsonMap;
      final response = Response(
        requestOptions: tRequestOptions,
        data: responsePayload,
        statusCode: 200,
        headers: Headers.fromMap({
          Headers.contentTypeHeader: [Headers.jsonContentType],
        }),
      );
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => response);
    }

    test(
      'make sure getDetailPokemon called with method GET',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        await remoteDataSource.getDetailPokemon(tName);

        // assert
        verify(
          mockDio.get(
            '$baseUrl/v2/pokemon/$tName',
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options'),
          ),
        );
      },
    );

    test(
      'make sure returns DetailPokemonResponse when response is (200) from endpoint',
      () async {
        // arrange
        setUpMockDioSuccess();

        // act
        final result = await remoteDataSource.getDetailPokemon(tName);

        // assert
        expect(result, tResponse);
      },
    );

    test(
      'make sure throw exception DioError when returns exception from endpoint',
      () async {
        // arrange
        final response = Response(
          requestOptions: tRequestOptions,
          data: 'Bad Request',
          statusCode: 400,
        );
        when(
          mockDio.get(
            any,
            queryParameters: anyNamed('queryParameters'),
            options: anyNamed('options'),
          ),
        ).thenAnswer((_) async => response);

        // act
        final call = remoteDataSource.getDetailPokemon(tName);

        // assert
        expect(() => call, throwsA(const TypeMatcher<DioError>()));
      },
    );
  });
}
