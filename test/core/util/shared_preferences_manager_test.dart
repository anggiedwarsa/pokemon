import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokemon/core/util/shared_preferences_manager.dart';

import '../../helper/mock_helper.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late SharedPreferencesManager sharedPreferencesManager;
  final tKey = 'testKey';

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    sharedPreferencesManager = SharedPreferencesManager.getInstance(mockSharedPreferences);
  });

  test('make sure SharedPreferencesManager instance succesfully created', () async {
    final sharedPreferencesManager = SharedPreferencesManager.getInstance(mockSharedPreferences);
    expect(sharedPreferencesManager, isA<SharedPreferencesManager>());
  });

  test(
    'make sure isKeyExists function is working',
    () async {
      // arrange
      when(mockSharedPreferences.containsKey(any)).thenReturn(true);

      // act
      var result = sharedPreferencesManager.isKeyExists(tKey);

      // assert
      verify(mockSharedPreferences.containsKey(tKey)).called(1);
      expect(result, true);
    },
  );

  test(
    'make sure clearKey function is working',
    () async {
      // arrange
      when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);

      // act
      var result = await sharedPreferencesManager.clearKey(tKey);

      // assert
      verify(mockSharedPreferences.remove(tKey)).called(1);
      expect(result, true);
    },
  );

  test(
    'make sure clearAll function is working',
    () async {
      // arrange
      when(mockSharedPreferences.clear()).thenAnswer((_) async => true);

      // act
      var result = await sharedPreferencesManager.clearAll();

      // assert
      verify(mockSharedPreferences.clear()).called(1);
      expect(result, true);
    },
  );

  group('bool', () {
    test(
      'make sure putBool function save boolean value',
      () async {
        // arrange
        when(mockSharedPreferences.setBool(tKey, any)).thenAnswer((_) async => true);

        // act
        await sharedPreferencesManager.putBool(tKey, true);

        // assert
        verify(mockSharedPreferences.setBool(tKey, true)).called(1);
      },
    );

    test(
      'make sure getBool function return boolean value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getBool(any)).thenReturn(true);

        // act
        var result = sharedPreferencesManager.getBool(tKey);

        // assert
        verify(mockSharedPreferences.getBool(tKey)).called(1);
        expect(result, true);
      },
    );
  });

  group('double', () {
    test(
      'make sure putDouble function save double value',
      () async {
        // arrange
        when(mockSharedPreferences.setDouble(any, any)).thenAnswer((_) async => true);

        // act
        await sharedPreferencesManager.putDouble(tKey, 1.0);

        // assert
        verify(mockSharedPreferences.setDouble(tKey, 1.0)).called(1);
      },
    );

    test(
      'make sure getDouble function return double value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getDouble(any)).thenReturn(1.0);

        // act
        var result = sharedPreferencesManager.getDouble(tKey);

        // assert
        verify(mockSharedPreferences.getDouble(tKey)).called(1);
        expect(result, 1.0);
      },
    );
  });

  group('int', () {
    test(
      'make sure putInt function save int value',
      () async {
        // arrange
        when(mockSharedPreferences.setInt(any, any)).thenAnswer((_) async => true);

        // act
        await sharedPreferencesManager.putInt(tKey, 1);

        // assert
        verify(mockSharedPreferences.setInt(tKey, 1)).called(1);
      },
    );

    test(
      'make sure getInt function return int value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getInt(any)).thenReturn(1);

        // act
        var result = sharedPreferencesManager.getInt(tKey);

        // assert
        verify(mockSharedPreferences.getInt(tKey)).called(1);
        expect(result, 1);
      },
    );
  });

  group('string', () {
    test(
      'make sure putString function save String value',
      () async {
        // arrange
        when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);

        // act
        await sharedPreferencesManager.putString(tKey, 'testValue');

        // assert
        verify(mockSharedPreferences.setString(tKey, 'testValue')).called(1);
      },
    );

    test(
      'make sure getString function return String value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getString(any)).thenReturn('testValue');

        // act
        var result = sharedPreferencesManager.getString(tKey);

        // assert
        verify(mockSharedPreferences.getString(tKey));
        expect(result, 'testValue');
      },
    );
  });

  group('stringList', () {
    test(
      'make sure putStringList function save List<String> value',
      () async {
        // arrange
        when(mockSharedPreferences.setStringList(any, any)).thenAnswer((_) async => true);

        // act
        await sharedPreferencesManager.putStringList(tKey, ['testValue']);

        // assert
        verify(mockSharedPreferences.setStringList(tKey, ['testValue'])).called(1);
      },
    );

    test(
      'make sure getStringList function return List<String> value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getStringList(any)).thenReturn(['testValue']);

        // act
        var result = sharedPreferencesManager.getStringList(tKey);

        // assert
        verify(mockSharedPreferences.getStringList(tKey)).called(1);
        expect(result, ['testValue']);
      },
    );
  });
}
