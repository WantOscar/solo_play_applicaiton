import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';

part 'register_state.freezed.dart';

enum RegisterStep { terms, email, password }
enum RegisterStatus { initial, loading, success, error }

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default(RegisterStep.terms) RegisterStep step,
    @Default(Register()) Register register,
    @Default(RegisterStatus.initial) RegisterStatus status,
    String? errorMessage,
  }) = _RegisterState;
}
