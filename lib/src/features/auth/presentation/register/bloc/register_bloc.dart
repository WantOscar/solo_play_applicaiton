import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';

import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<UpdateTermsAgreement>(_onUpdateTermsAgreement);
    on<UpdateEmail>(_onUpdateEmail);
    on<UpdatePassword>(_onUpdatePassword);
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
    ));
  }

  void _onUpdateEmail(
    UpdateEmail event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      register: state.register.copyWith(
        email: event.email,
      ),
    ));
  }

  void _onUpdatePassword(
    UpdatePassword event,
    Emitter<RegisterState> emit,
  ) {
    emit(state.copyWith(
      register: state.register.copyWith(
        password: event.password,
      ),
    ));
  }
}

