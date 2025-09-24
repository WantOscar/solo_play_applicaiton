import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

class UserRegisterUsecaseImpl extends UserRegisterUsecase {
  final AuthRepository _authRepository;

  UserRegisterUsecaseImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Result<void>> call(Register register) async {
    return await _authRepository.register(register);
  }
}

abstract class UserRegisterUsecase {
  Future<Result<void>> call(Register register);
}
