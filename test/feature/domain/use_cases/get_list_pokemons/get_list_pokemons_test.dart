import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';
import 'package:pokemon/features/domain/use_cases/get_list_pokemons/get_list_pokemons.dart';

import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late GetListPokemons usecase;
  late MockPokemonsRepository mockPokemonsRepository;

  final tOffset = '100';
  final tLimit = '100';
  final tParams = ParamsGetListPokemons(
    offset: tOffset,
    limit: tLimit,
  );

  setUp(() {
    mockPokemonsRepository = MockPokemonsRepository();
    usecase = GetListPokemons(
      repository: mockPokemonsRepository,
    );
  });

  test(
    'make sure usecase sucessful receive response from endpoint',
    () async {
      // arrange
      final tResponse = DataPage<ResultResponse>();
      when(mockPokemonsRepository.getListPokemons(any, any)).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, Right(tResponse));
      verify(mockPokemonsRepository.getListPokemons(tOffset, tLimit));
      verifyNoMoreInteractions(mockPokemonsRepository);
    },
  );

  test(
    'make sure props value',
    () async {
      // assert
      expect(
        tParams.props,
        [
          tParams.offset,
          tParams.limit,
        ],
      );
    },
  );

  test(
    'make sure toString function',
    () async {
      // assert
      expect(
        tParams.toString(),
        'ParamsGetListPokemons{offset: ${tParams.offset}, limit: ${tParams.limit}}',
      );
    },
  );
}
