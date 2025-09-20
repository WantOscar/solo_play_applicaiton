import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';

void main() {
  group('RegisterBloc', () {
    const userAgreement = UserAgreement(
      isOver14: true,
      isAgreedToTerms: true,
      isAgreedToMarketing: true,
      isConsentedToAds: false,
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterState] with updated terms agreement when UpdateTermsAgreement is added.',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const UpdateTermsAgreement(userAgreement: userAgreement)),
      expect: () => [
        const RegisterState(
          register: Register(
            termsAgreed: true,
            userAgreement: userAgreement,
          ),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterState] with updated email when UpdateEmail is added.',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const UpdateEmail(email: 'test@example.com')),
      expect: () => [
        const RegisterState(
          register: Register(email: 'test@example.com'),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterState] with updated password when UpdatePassword is added.',
      build: () => RegisterBloc(),
      act: (bloc) => bloc.add(const UpdatePassword(password: 'password')),
      expect: () => [
        const RegisterState(
          register: Register(password: 'password'),
        ),
      ],
    );
  });
}
