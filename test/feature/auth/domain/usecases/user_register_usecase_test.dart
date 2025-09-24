import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/models/user_agreement.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_register_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late UserRegisterUsecase usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = UserRegisterUsecase(repository: mockAuthRepository);
  });

  final userAgreement = UserAgreement(
    isOver14: true,
    isAgreedToTerms: true,
    isAgreedToMarketing: false,
    isConsentedToAds: false,
  );

  final registerInfo = RegisterInfo(
    email: 'test@test.com',
    password: 'password',
    userAgreement: userAgreement,
  );

  test('should call authRepository.register', () async {
    // Arrange
    when(() => mockAuthRepository.register(registerInfo))
        .thenAnswer((_) async => Success(null));

    // Act
    final result = await usecase(registerInfo);

    // Assert
    expect(result, isA<Success>());
    verify(() => mockAuthRepository.register(registerInfo)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
