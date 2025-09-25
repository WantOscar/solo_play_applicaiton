import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/user_agreement.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';

class MockUserRegisterUsecase extends Mock implements UserRegisterUsecase {}

void main() {
  setUpAll(() {
    registerFallbackValue(const Register());
  });

  group('RegisterBloc', () {
    late MockUserRegisterUsecase mockUserRegisterUsecase;

    const userAgreement = UserAgreement(
      isOver14: true,
      isAgreedToTerms: true,
      isAgreedToMarketing: true,
      isConsentedToAds: false,
    );

    setUp(() {
      mockUserRegisterUsecase = MockUserRegisterUsecase();
    });

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterState] with updated terms agreement when UpdateTermsAgreement is added.',
      build: () => RegisterBloc(userRegisterUsecase: mockUserRegisterUsecase),
      act: (bloc) =>
          bloc.add(const UpdateTermsAgreement(userAgreement: userAgreement)),
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
      build: () => RegisterBloc(userRegisterUsecase: mockUserRegisterUsecase),
      act: (bloc) => bloc.add(const UpdateEmail(email: 'test@example.com')),
      expect: () => [
        const RegisterState(
          register: Register(email: 'test@example.com'),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterState] with updated password when UpdatePassword is added.',
      build: () => RegisterBloc(userRegisterUsecase: mockUserRegisterUsecase),
      act: (bloc) => bloc.add(const UpdatePassword(password: 'password')),
      expect: () => [
        const RegisterState(
          register: Register(password: 'password'),
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterStatus.loading, RegisterStatus.success] when RegisterSubmitted is added and registration is successful.',
      build: () {
        when(() => mockUserRegisterUsecase.call(any()))
            .thenAnswer((_) async => const Result.success(null));
        return RegisterBloc(userRegisterUsecase: mockUserRegisterUsecase);
      },
      act: (bloc) {
        bloc.add(const UpdateEmail(email: 'test@example.com'));
        bloc.add(const UpdatePassword(password: 'password'));
        bloc.add(const RegisterSubmitted(
            email: 'test@example.com', password: 'password'));
      },
      expect: () => [
        const RegisterState(register: Register(email: 'test@example.com')),
        const RegisterState(
            register:
                Register(email: 'test@example.com', password: 'password')),
        const RegisterState(
          register: Register(email: 'test@example.com', password: 'password'),
          status: RegisterStatus.loading,
        ),
        const RegisterState(
          register: Register(email: 'test@example.com', password: 'password'),
          status: RegisterStatus.success,
        ),
      ],
      verify: (_) {
        verify(() => mockUserRegisterUsecase.call(
              const Register(email: 'test@example.com', password: 'password'),
            )).called(1);
      },
    );

    blocTest<RegisterBloc, RegisterState>(
      'emits [RegisterStatus.loading, RegisterStatus.error] when RegisterSubmitted is added and registration fails.',
      build: () {
        when(() => mockUserRegisterUsecase.call(any())).thenAnswer(
            (_) async => const Result.failure('Registration failed'));
        return RegisterBloc(userRegisterUsecase: mockUserRegisterUsecase);
      },
      act: (bloc) {
        bloc.add(const UpdateEmail(email: 'test@example.com'));
        bloc.add(const UpdatePassword(password: 'password'));
        bloc.add(const RegisterSubmitted(
            email: 'test@example.com', password: 'password'));
      },
      expect: () => [
        const RegisterState(register: Register(email: 'test@example.com')),
        const RegisterState(
            register:
                Register(email: 'test@example.com', password: 'password')),
        const RegisterState(
          register: Register(email: 'test@example.com', password: 'password'),
          status: RegisterStatus.loading,
        ),
        const RegisterState(
          register: Register(email: 'test@example.com', password: 'password'),
          status: RegisterStatus.error,
          errorMessage: 'Registration failed',
        ),
      ],
      verify: (_) {
        verify(() => mockUserRegisterUsecase.call(
              const Register(email: 'test@example.com', password: 'password'),
            )).called(1);
      },
    );
  });
}
