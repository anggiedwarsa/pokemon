import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/features/data/models/data_api_failure/data_api_failure.dart';

void main() {
  final tDataApiFailure = const DataApiFailure(
    statusCode: 0,
    message: 'testMessage',
    httpMessage: 'testHttpMessage',
    errorData: {},
  );

  test(
    'make sure props value',
    () async {
      // assert
      expect(
        tDataApiFailure.props,
        [
          tDataApiFailure.statusCode,
          tDataApiFailure.message,
          tDataApiFailure.httpMessage,
          tDataApiFailure.errorData,
        ],
      );
    },
  );

  test(
    'make sure toString function',
    () async {
      // assert
      expect(
        tDataApiFailure.toString(),
        'DataApiFailure{statusCode: ${tDataApiFailure.statusCode}, message: ${tDataApiFailure.message}, httpMessage: ${tDataApiFailure.httpMessage}, errorData: ${tDataApiFailure.errorData}}',
      );
    },
  );
}
