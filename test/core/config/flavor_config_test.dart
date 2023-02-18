import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon/config/flavor_config.dart';

void main() {
  setUp(() {
    FlavorConfig(
      flavor: Flavor.PRODUCTION,
      values: FlavorValues(
        baseUrlRootWeb: '',
        baseUrlEndpoint: '',
      ),
    );
  });

  test(
    'make sure isProduction function is working',
    () async {
      // act
      final actualResult = FlavorConfig.isProduction();

      // assert
      expect(actualResult, true);
    },
  );

  test(
    'make sure isDevelopment function is working',
    () async {
      // act
      final actualResult = FlavorConfig.isDevelopment();

      // assert
      expect(actualResult, false);
    },
  );
}
