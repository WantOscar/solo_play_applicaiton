import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegisterUsecase _userRegisterUsecase;

  RegisterBloc({
    required UserRegisterUsecase userRegisterUsecase,
  })  : _userRegisterUsecase = userRegisterUsecase,
        super(const RegisterState()) {
    on<UpdateTermsAgreement>(_onUpdateTermsAgreement);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  void _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(status: RegisterStatus.loading));
    final result = await _userRegisterUsecase.call(state.register);

    switch (result) {
      case Success():
        emit(state.copyWith(status: RegisterStatus.success));
        break;
      case Failure(message: final message):
        emit(state.copyWith(
          status: RegisterStatus.error,
          errorMessage: message,
        ));
        break;
    }
  }

  void _onUpdateTermsAgreement(
    UpdateTermsAgreement event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
        register: state.register.copyWith(
          termsAgreed: event.userAgreement.isUserAgree,
          userAgreement: event.userAgreement,
        ),
        step: RegisterStep.email));
  }

  void _onUpdateEmail(
    UpdateEmail event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
        register: state.register.copyWith(
          email: event.email,
        ),
        step: RegisterStep.password));
  }

  void _onUpdatePassword(
    UpdatePassword event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      register: state.register.copyWith(
        password: event.password,
      ),
      step: RegisterStep.verification,
    ));
  }
}
