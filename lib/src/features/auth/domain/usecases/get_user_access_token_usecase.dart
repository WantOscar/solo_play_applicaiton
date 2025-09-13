import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

abstract class GetUserAccessTokenUseCase {
  Future<String?> call();
}

class GetUserAccessTokenUseCaseImpl implements GetUserAccessTokenUseCase {
  final AuthRepository _authRepository;

  GetUserAccessTokenUseCaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<String?> call() {
    return _authRepository.getAccessToken();
  }
}
