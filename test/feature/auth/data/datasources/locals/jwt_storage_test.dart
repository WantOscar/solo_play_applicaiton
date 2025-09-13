import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/jwt_storage_impl.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late JwtStorageImpl jwtStorage;
  final String accessTokenKey = JwtStorageImpl.accessTokenKey;
  final String refreshTokenKey = JwtStorageImpl.refreshTokenKey;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    // JwtStorageImpl's constructor calls _init(), which calls readAccessToken().
    // We need to provide a default mock for read() before creating the instance
    // to avoid a MissingStubError.
    when(() => mockStorage.read(key: any(named: 'key')))
        .thenAnswer((_) async => null);

    jwtStorage = JwtStorageImpl(storage: mockStorage);

    // Provide default stubs for write and delete operations.
    when(() => mockStorage.write(
        key: any(named: 'key'),
        value: any(named: 'value'))).thenAnswer((_) async => {});
    when(() => mockStorage.delete(key: any(named: 'key')))
        .thenAnswer((_) async => {});
  });

  tearDown(() {
    jwtStorage.dispose();
  });

  group('save and read', () {
    test('saveAccessToken writes to storage', () async {
      const token = 'access_token_value';

      await jwtStorage.saveAccessToken(token);

      verify(() => mockStorage.write(
            key: accessTokenKey,
            value: token,
          )).called(1);
    });

    test('saveRefreshToken writes to storage', () async {
      const token = 'refresh_token_value';

      await jwtStorage.saveRefreshToken(token);

      verify(() => mockStorage.write(
            key: refreshTokenKey,
            value: token,
          )).called(1);
    });

    test('readAccessToken returns stored value', () async {
      const token = 'stored_access_token';
      when(() => mockStorage.read(key: accessTokenKey))
          .thenAnswer((_) async => token);

      final result = await jwtStorage.readAccessToken();

      expect(result, token);
    });

    test('readRefreshToken returns stored value', () async {
      const token = 'stored_refresh_token';
      when(() => mockStorage.read(key: refreshTokenKey))
          .thenAnswer((_) async => token);

      final result = await jwtStorage.readRefreshToken();

      expect(result, token);
      verify(() => mockStorage.read(key: refreshTokenKey)).called(1);
    });
  });

  group('delete', () {
    test('deleteAccessToken deletes from storage', () async {
      await jwtStorage.deleteAccessToken();

      verify(() => mockStorage.delete(key: accessTokenKey)).called(1);
    });

    test('deleteRefreshToken deletes from storage', () async {
      await jwtStorage.deleteRefreshToken();

      verify(() => mockStorage.delete(key: refreshTokenKey)).called(1);
    });
  });

  group('tokenStream', () {
    test('emits the correct token values throughout the lifecycle', () async {
      // Arrange
      const token = 'new_token';
      // A new instance is created to ensure we can reliably test the stream from the beginning.
      // The _init method will be called in the constructor, which should emit an initial null.
      final jwtStorageForStreamTest = JwtStorageImpl(storage: mockStorage);

      // Assert
      // We expect a specific sequence of events on the stream.
      final streamExpectation = expectLater(
        jwtStorageForStreamTest.tokenStream,
        emitsInOrder([
          null, // Initial value from _init
          token, // Value after saveAccessToken
          null, // Value after deleteAccessToken
          emitsDone, // Stream closes on dispose
        ]),
      );

      // Act
      // A microtask delay ensures the stream listener is attached before events are sent.
      await Future.microtask(() {});

      await jwtStorageForStreamTest.saveAccessToken(token);
      await jwtStorageForStreamTest.deleteAccessToken();
      jwtStorageForStreamTest.dispose();

      // Wait for the stream expectation to complete to confirm all events were matched.
      await streamExpectation;
    });
  });
}
