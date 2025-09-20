import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/send_verification_email_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late SendVerificationEmailUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase =
        SendVerificationEmailUsecaseImpl(authRepository: mockAuthRepository);
  });

  const tEmail = 'test@test.com';

  group(SendVerificationEmailUsecase, () {
    test('should send verification email from the repository', () async {
      // arrange
      when(() => mockAuthRepository.sendVerificationEmail(any()))
          .thenAnswer((_) async => const Success('Success'));
      // act
      final result = await usecase(tEmail);
      // assert
      expect(result, const Success('Success'));
      verify(() => mockAuthRepository.sendVerificationEmail(tEmail));
      verifyNoMoreInteractions(mockAuthRepository);
    });
  });
}
