import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/proof_token_storage.dart';
import 'package:solo_play_application/src/features/auth/data/datasources/locals/proof_token_storage_impl.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late ProofTokenStorage proofTokenStorage;
  late MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    proofTokenStorage =
        ProofTokenStorageImpl(storage: mockFlutterSecureStorage);
    registerFallbackValue(const Duration(seconds: 1));
  });

  group(ProofTokenStorage, () {
    const proofToken = 'test_token';
    const proofTokenKey = ProofTokenStorageImpl.proofTokenKey;

    test('should call FlutterSecureStorage.write to save the proof token',
        () async {
      // Arrange
      when(() => mockFlutterSecureStorage.write(
          key: proofTokenKey,
          value: proofToken)).thenAnswer((_) async => Future.value());

      // Act
      await proofTokenStorage.saveProofToken(proofToken);

      // Assert
      verify(() => mockFlutterSecureStorage.write(
          key: proofTokenKey, value: proofToken)).called(1);
      verifyNoMoreInteractions(mockFlutterSecureStorage);
    });

    test('should call FlutterSecureStorage.delete to delete the proof token',
        () async {
      // Arrange
      when(() => mockFlutterSecureStorage.delete(key: proofTokenKey))
          .thenAnswer((_) async => Future.value());

      // Act
      await proofTokenStorage.deleteProofToken();

      // Assert
      verify(() => mockFlutterSecureStorage.delete(key: proofTokenKey))
          .called(1);
      verifyNoMoreInteractions(mockFlutterSecureStorage);
    });

    test('should call FlutterSecureStorage.read to read the proof token',
        () async {
      // Arrange
      when(() => mockFlutterSecureStorage.read(key: proofTokenKey))
          .thenAnswer((_) async => proofToken);

      // Act
      final result = await proofTokenStorage.readProofToken();

      // Assert
      expect(result, proofToken);
      verify(() => mockFlutterSecureStorage.read(key: proofTokenKey)).called(1);
      verifyNoMoreInteractions(mockFlutterSecureStorage);
    });
  });
}
