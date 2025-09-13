import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/login_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginUsecase _userLoginUsecase;
  LoginBloc({
    required UserLoginUsecase userLoginUsecase,
  })  : _userLoginUsecase = userLoginUsecase,
        super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginButtonTap>(_onLoginButtonTaped);
  }

  @override
  void onChange(Change<LoginState> change) {
    log("currState : ${change.currentState} nextState : ${change.nextState}");
    super.onChange(change);
  }

  FutureOr<void> _onEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onLoginButtonTaped(
      LoginButtonTap event, Emitter<LoginState> emit) async {
    final result = await _userLoginUsecase.call(state.email, state.password);

    if (result is Failure) {
      emit(state.copyWith(errorMessage: result.message));
    }
  }
}
