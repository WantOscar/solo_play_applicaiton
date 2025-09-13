import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/register_password_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/register_password_state.dart';

class RegisterPasswordBloc
    extends Bloc<RegisterPasswordEvent, RegisterPasswordState> {
  RegisterPasswordBloc() : super(RegisterPasswordState()) {
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterPasswordCheckChanged>(_onPasswordCheckChanged);
    on<ObscurePasswordToggled>(_onObscurePasswordToggled);
    on<ObscurePasswordCheckToggled>(_onObscurePasswordCheckToggled);
  }

  FutureOr<void> _onPasswordChanged(
      RegisterPasswordChanged event, Emitter<RegisterPasswordState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onPasswordCheckChanged(
      RegisterPasswordCheckChanged event, Emitter<RegisterPasswordState> emit) {
    emit(state.copyWith(passwordCheck: event.password));
  }

  FutureOr<void> _onObscurePasswordToggled(
      ObscurePasswordToggled event, Emitter<RegisterPasswordState> emit) {
    final prevObscure = state.obscurePassword;
    emit(state.copyWith(obscurePassword: !prevObscure));
  }

  FutureOr<void> _onObscurePasswordCheckToggled(
      ObscurePasswordCheckToggled event, Emitter<RegisterPasswordState> emit) {
    final prevObscure = state.obscurePasswordCheck;
    emit(state.copyWith(obscurePasswordCheck: !prevObscure));
  }
}
