import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/send_verification_email_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final SendVerificationEmailUsecase _sendVerificationEmailUsecase;

  VerificationBloc({
    required SendVerificationEmailUsecase sendVerificationEmailUsecase,
  })  : _sendVerificationEmailUsecase = sendVerificationEmailUsecase,
        super(const VerificationState()) {
    on<VerificationCodeChanged>(_onCodeChanged);
    on<VerificationEmailSent>(_onVerificationEmailSent);
  }

  FutureOr<void> _onCodeChanged(
    VerificationCodeChanged event,
    Emitter<VerificationState> emit,
  ) {
    emit(state.copyWith(code: event.code));
  }

  FutureOr<void> _onVerificationEmailSent(
    VerificationEmailSent event,
    Emitter<VerificationState> emit,
  ) async {
    emit(state.copyWith(status: VerificationStatus.sending));
    final result = await _sendVerificationEmailUsecase.call(event.email);
    switch (result) {
      case Success():
        emit(state.copyWith(status: VerificationStatus.sent));
      case Failure():
        emit(state.copyWith(
          status: VerificationStatus.error,
          errorMessage: result.message,
        ));
    }
  }
}
