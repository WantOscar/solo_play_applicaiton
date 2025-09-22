import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/verify_code_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_verify_code_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late UserVerifyCodeUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserVerifyCodeUsecaseImpl(authRepository: mockAuthRepository);
    registerFallbackValue(VerifyCodeInfo(email: '', code: ''));
  });

  group('UserVerifyCodeUsecase', () {
    const email = 'test@test.com';
    const code = '123456';

    test('should call repository.verifyCode and return success', () async {
      // Arrange
      when(() => mockAuthRepository.verifyCode(any()))
          .thenAnswer((_) async => Success('message'));

      // Act
      final result = await usecase.call(email, code);

      // Assert
      expect(result, isA<Success>());
      verify(() => mockAuthRepository.verifyCode(any())).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });

    test('should call repository.verifyCode and return failure', () async {
      // Arrange
      when(() => mockAuthRepository.verifyCode(any()))
          .thenAnswer((_) async => Failure('error'));

      // Act
      final result = await usecase.call(email, code);

      // Assert
      expect(result, isA<Failure>());
      verify(() => mockAuthRepository.verifyCode(any())).called(1);
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
