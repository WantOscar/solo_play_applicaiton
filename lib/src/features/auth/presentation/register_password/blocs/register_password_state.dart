import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:solo_play_application/src/core/utils/validators/password_validator.dart';

part 'register_password_state.freezed.dart';

@freezed
abstract class RegisterPasswordState with _$RegisterPasswordState {
  const factory RegisterPasswordState({
    @Default("") String password,
    @Default(true) bool obscurePassword,
    @Default("") String passwordCheck,
    @Default(true) bool obscurePasswordCheck,
  }) = _RegisterPasswordState;

  const RegisterPasswordState._();

  bool get isValidPassword {
    return PasswordValidator.isValidPassword(password);
  }

  bool get isValidPasswordCheck {
    return PasswordValidator.isValidPassword(passwordCheck);
  }

  bool get doPasswordsMatch {
    return PasswordValidator.doPasswordsMatch(password, passwordCheck);
  }

  bool get isAvail {
    return isValidPassword && isValidPasswordCheck && doPasswordsMatch;
  }
}
