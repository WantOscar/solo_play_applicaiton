import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_logout_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/watch_user_access_token_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final WatchUserAccessTokenUseCase _watchUserAccessTokenUseCase;
  final UserLogoutUsecase _userLogoutUsecase;

  AuthBloc({
    required WatchUserAccessTokenUseCase watchUserAccessTokenUseCase,
    required UserLogoutUsecase userLogoutUsecase,
  })  : _watchUserAccessTokenUseCase = watchUserAccessTokenUseCase,
        _userLogoutUsecase = userLogoutUsecase,
        super(Unknown()) {
    on<AuthSubscriptionRequested>(_onSubscriptionReqeusted);
    on<LogoutTapped>(_onLogoutTapped);
  }

  FutureOr<void> _onSubscriptionReqeusted(
      AuthSubscriptionRequested event, Emitter<AuthState> emit) {
    return emit.onEach(_watchUserAccessTokenUseCase.call(),
        onData: (status) async {
      switch (status) {
        case AuthenticateStatus.unknown:
          emit(Unknown());
        case AuthenticateStatus.authenticated:
          emit(Authenticated());
        case AuthenticateStatus.unauthenticated:
          emit(Unauthenticated());
      }
    });
  }

  FutureOr<void> _onLogoutTapped(
      LogoutTapped event, Emitter<AuthState> emit) async {
    await _userLogoutUsecase.call();
  }
}
