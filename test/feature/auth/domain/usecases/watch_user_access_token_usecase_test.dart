import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';

import 'package:solo_play_application/src/features/auth/domain/usecases/watch_user_access_token_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

/// ✅ Mock 클래스 정의
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late WatchUserAccessTokenUseCaseImpl useCase;

  group(WatchUserAccessTokenUseCaseImpl, () {
    setUp(() {
      mockAuthRepository = MockAuthRepository();

      useCase = WatchUserAccessTokenUseCaseImpl(
        authRepository: mockAuthRepository,
      );
    });

    test('should emit auth status correclty when call()', () async {
      // Arrange
      final controller = StreamController<AuthenticateStatus>();
      when(() => mockAuthRepository.authStatusStream)
          .thenAnswer((_) => controller.stream);

      // Act
      final resultStream = useCase.call();

      // Assert
      expect(
          resultStream,
          emitsInOrder([
            AuthenticateStatus.unknown,
            AuthenticateStatus.authenticated,
            AuthenticateStatus.unauthenticated,
          ]));

      // 실제 값 방출
      controller.add(AuthenticateStatus.unknown);
      controller.add(AuthenticateStatus.authenticated);
      controller.add(AuthenticateStatus.unauthenticated);

      await controller.close();
    });

    test('should close when dispose()', () {
      // Arrange
      when(() => mockAuthRepository.dispose()).thenReturn(null);

      // Act
      useCase.close();

      // Assert
      verify(() => mockAuthRepository.dispose()).called(1);
    });
  });
}
