import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/verify_code_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

abstract class UserVerifyCodeUsecase {
  Future<Result<void>> call(String email, String code);
}

class UserVerifyCodeUsecaseImpl extends UserVerifyCodeUsecase {
  final AuthRepository _authRepository;

  UserVerifyCodeUsecaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Result<void>> call(String email, String code) async {
    final verifyCodeInfo = VerifyCodeInfo(email: email, code: code);
    return await _authRepository.verifyCode(verifyCodeInfo);
  }
}
