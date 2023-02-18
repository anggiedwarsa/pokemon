import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/pagination/pagination.dart';
import 'package:pokemon/features/data/models/result/result_response.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  final jsonData = json.decode(fixture('list_pokemon_response.json'));

  group('DataPage', () {
    final tModel = DataPage<ResultResponse>.fromJson(jsonData, ResultResponse.fromJson);

    test(
      'make sure props value',
      () async {
        // assert
        expect(
          tModel.props,
          [
            tModel.count,
            tModel.next,
            tModel.previous,
            tModel.results,
          ],
        );
      },
    );

    test(
      'make sure toString function',
      () async {
        // assert
        expect(
          tModel.toString(),
          'DataPage{count: ${tModel.count}, next: ${tModel.next}, previous: ${tModel.previous}, results: ${tModel.results}}',
        );
      },
    );

    test(
      'make sure fromJson function return actual model',
      () async {
        // act
        final actualModel = DataPage<ResultResponse>.fromJson(jsonData, ResultResponse.fromJson);

        // assert
        expect(actualModel, tModel);
      },
    );
  });
}
