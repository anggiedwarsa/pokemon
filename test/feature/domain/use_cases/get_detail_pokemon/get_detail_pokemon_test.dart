import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/features/data/models/pokemon/detail_pokemon_response.dart';
import 'package:pokemon/features/domain/use_cases/get_detail_pokemon/get_detail_pokemon.dart';

import '../../../../helper/mock_helper.mocks.dart';

void main() {
  late GetDetailPokemon usecase;
  late MockPokemonsRepository mockPokemonsRepository;

  final tName = 'pokemon';
  final tParams = ParamsGetDetailPokemon(name: tName);

  setUp(() {
    mockPokemonsRepository = MockPokemonsRepository();
    usecase = GetDetailPokemon(
      repository: mockPokemonsRepository,
    );
  });

  test(
    'make sure usecase sucessful receive response from endpoint',
    () async {
      // arrange
      final tResponse = DetailPokemonResponse();
      when(mockPokemonsRepository.getDetailPokemon(any)).thenAnswer((_) async => Right(tResponse));

      // act
      final result = await usecase(tParams);

      // assert
      expect(result, Right(tResponse));
      verify(mockPokemonsRepository.getDetailPokemon(tName));
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
          tParams.name,
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
        'ParamsGetDetailPokemon{name: ${tParams.name}}',
      );
    },
  );
}
