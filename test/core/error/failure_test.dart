import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/core/error/failure.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';

void main() {
  final tErrorMessage = 'testErrorMessage';

  group('ServerFailure', () {
    final tDataApiFailure = DataApiFailure(
      statusCode: 400,
      message: 'Bad Request',
      httpMessage: '[400] Bad Request',
    );
    final tServerFailure = ServerFailure(tDataApiFailure);

    test(
      'make sure the props value',
      () async {
        // assert
        expect(
          tServerFailure.props,
          [
            tServerFailure.dataApiFailure,
          ],
        );
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(
          tServerFailure.toString(),
          'ServerFailure{dataApiFailure: ${tServerFailure.dataApiFailure}}',
        );
      },
    );
  });

  group('CacheFailure', () {
    final tCacheFailure = CacheFailure(tErrorMessage);

    test(
      'make sure the props value',
      () async {
        // arrange
        expect(
          tCacheFailure.props,
          [
            tCacheFailure.errorMessage,
          ],
        );
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(
          tCacheFailure.toString(),
          'CacheFailure{errorMessage: $tErrorMessage}',
        );
      },
    );
  });

  group('ConnectionFailure', () {
    final tConnectionFailure = ConnectionFailure();

    test(
      'pastikan nilai props',
      () async {
        // assert
        expect(
          tConnectionFailure.props,
          [
            tConnectionFailure.errorMessage,
          ],
        );
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(
          tConnectionFailure.toString(),
          'ConnectionFailure{errorMessage: ${tConnectionFailure.errorMessage}}',
        );
      },
    );
  });

  group('ParsingFailure', () {
    test(
      'make sure the props value',
      () async {
        // assert
        expect(ParsingFailure(tErrorMessage).props, [tErrorMessage]);
      },
    );

    test(
      'make sure the value of the toString() function',
      () async {
        // assert
        expect(
          ParsingFailure(tErrorMessage).toString(),
          'ParsingFailure{errorMessage: $tErrorMessage}',
        );
      },
    );
  });
}
