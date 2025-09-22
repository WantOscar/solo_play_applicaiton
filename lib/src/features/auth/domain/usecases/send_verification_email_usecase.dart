import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

final class SendVerificationEmailUsecaseImpl
    implements SendVerificationEmailUsecase {
  final AuthRepository _authRepository;

  const SendVerificationEmailUsecaseImpl({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;
  @override
  Future<Result<String>> call(String email) async {
    return await _authRepository.sendVerificationEmail(email);
  }
}

abstract class SendVerificationEmailUsecase {
  Future<Result<String>> call(String email);
}
