import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register_info.dart';
import 'package:solo_play_application/src/features/auth/domain/repositories/auth_repository.dart';

class UserRegisterUsecase {
  final AuthRepository _repository;

  UserRegisterUsecase({required AuthRepository repository}) : _repository = repository;

  Future<Result<void>> call(RegisterInfo registerInfo) async {
    return await _repository.register(registerInfo);
  }
}
