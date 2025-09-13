import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/bloc.dart';

import 'package:test/test.dart';

import '../mocks/mock_user_login_usecase.dart';

void main() {
  group(LoginBloc, () {
    late MockUserLoginUsecase userloginUsecase;
    late LoginBloc loginBloc;

    setUp(() {
      userloginUsecase = MockUserLoginUsecase();
      loginBloc = LoginBloc(userLoginUsecase: userloginUsecase);
    });

    test(
        'initial state is email is empty and password is empty and obscure text is false',
        () {
      final state = loginBloc.state;
      expect(state.email.isEmpty, true);
      expect(state.password.isEmpty, true);
    });

    blocTest(
      'should emit new email when LoginUiEmailChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginEmailChanged(email: 'test@test.com')),
      expect: () => [LoginState(email: "test@test.com")],
    );

    blocTest(
      'should emit new email when LoginUiPasswordChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginPasswordChanged(password: 'password')),
      expect: () => [LoginState(password: "password")],
    );

    blocTest(
      'should emit new password when LoginUiPasswordChanged is added',
      build: () => loginBloc,
      act: (bloc) => bloc.add(LoginPasswordChanged(password: 'password')),
      expect: () => [LoginState(password: "password")],
    );

    blocTest(
      'should call userLoginUsecase when LoginUiPasswordChanged is added',
      build: () => loginBloc,
      act: (bloc) {
        // given
        when(() => userloginUsecase.call(any(), any()))
            .thenAnswer((_) async => const Success(null));

        // when
        loginBloc.add(LoginButtonTap());
      },
      verify: (_) {
        verify(() => userloginUsecase.call(any(), any())).called(1);
      },
    );

    blocTest(
      'should emit errorMessage when onLoginButtonTaped is added and return failure',
      build: () => loginBloc,
      act: (bloc) {
        // given
        when(() => userloginUsecase.call(any(), any()))
            .thenAnswer((_) async => const Failure("some error occured!"));

        // when
        loginBloc.add(LoginButtonTap());
      },
      expect: () => [LoginState(errorMessage: "some error occured!")],
      verify: (_) {
        verify(() => userloginUsecase.call(any(), any())).called(1);
      },
    );
  });
}
