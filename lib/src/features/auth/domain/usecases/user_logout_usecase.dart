import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

class UserLogoutUsecaseImpl extends UserLogoutUsecase {
  final AuthRepository _authRepository;

  UserLogoutUsecaseImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<void> call() {
    return _authRepository.logout();
  }
}

abstract class UserLogoutUsecase {
  Future<void> call();
}
