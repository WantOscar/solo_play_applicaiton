import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

class WatchUserAccessTokenUseCaseImpl extends WatchUserAccessTokenUseCase {
  final AuthRepository _authRepository;

  WatchUserAccessTokenUseCaseImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Stream<AuthenticateStatus> call() {
    return _authRepository.authStatusStream;
  }

  @override
  void close() {
    return _authRepository.dispose();
  }
}

abstract class WatchUserAccessTokenUseCase {
  Stream<AuthenticateStatus> call();

  void close();
}
