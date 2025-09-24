import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/login_info.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/verify_code_info.dart';

abstract class AuthRepository {
  Stream<AuthenticateStatus> get authStatusStream;

  Future<Result<String>> checkEmailDuplicate(String email);

  Future<Result<void>> login(LoginInfo login);

  Future<Result<void>> register(Register registerInfo);

  Future<Result<String>> sendVerificationEmail(String email);

  Future<Result<String>> verifyCode(VerifyCodeInfo request);

  Future<void> logout();

  Future<String?> getAccessToken();

  void dispose();
}
