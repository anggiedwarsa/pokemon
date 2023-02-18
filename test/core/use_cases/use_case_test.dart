import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/core/use_cases/use_case.dart';

void main() {
  test(
    'make sure that the props of NoParams is []',
    () async {
      // assert
      expect(NoParams().props, []);
    },
  );
}
