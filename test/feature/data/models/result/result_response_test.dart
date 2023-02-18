import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final jsonData = json.decode(fixture('list_pokemon_response.json'))['results'][0];

  group('ResultResponse', () {
    final tModel = ResultResponse.fromJson(jsonData);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.name,
            tModel.url,
          ],
        );
      },
    );

    test(
      'make sure toString output',
      () async {
        // assert
        expect(
          tModel.toString(),
          'ResultResponse{name: ${tModel.name}, url: ${tModel.url}}',
        );
      },
    );

    test(
      'make sure fromJson function return ResultResponse',
      () async {
        // act
        final actualModel = ResultResponse.fromJson(jsonData);

        // assert
        expect(actualModel, tModel);
      },
    );

    test(
      'make sure toJson function return Map object',
      () async {
        // arrange
        final model = ResultResponse.fromJson(jsonData);

        // act
        final actualMap = json.encode(model.toJson());

        // assert
        expect(actualMap, json.encode(tModel.toJson()));
      },
    );
  });
}
