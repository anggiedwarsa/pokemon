import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/service/network_info.dart';

import '../../helper/mock_helper.mocks.dart';

void main() {
  late NetworkInfoImpl networkInfoImpl;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfoImpl = NetworkInfoImpl(mockConnectivity);
  });

  group('ConnectionChecker', () {
    test(
      'make sure checkConnectivity function works with mobile data connection',
      () async {
        // arrange
        final tHasConnection = Future.value(ConnectivityResult.mobile);
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) => tHasConnection);

        // act
        final result = await networkInfoImpl.isConnected;

        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, true);
      },
    );

    test(
      'make sure checkConnectivity function works with wifi connection',
      () async {
        // arrange
        final tHasConnection = Future.value(ConnectivityResult.wifi);
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) => tHasConnection);

        // act
        final result = await networkInfoImpl.isConnected;

        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, true);
      },
    );

    test(
      'make sure checkConnectivity function works with no connection',
      () async {
        // arrange
        final tHasConnection = Future.value(ConnectivityResult.none);
        when(mockConnectivity.checkConnectivity()).thenAnswer((_) => tHasConnection);

        // act
        final result = await networkInfoImpl.isConnected;

        // assert
        verify(mockConnectivity.checkConnectivity());
        expect(result, false);
      },
    );
  });
}
