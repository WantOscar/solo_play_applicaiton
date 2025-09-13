import 'package:bloc_test/bloc_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/bloc.dart';
import 'package:test/test.dart';

void main() {
  group(RegisterPasswordBloc, () {
    late RegisterPasswordBloc bloc;

    setUp(() {
      bloc = RegisterPasswordBloc();
    });

    test('should returns initial state correctly', () {
      expect(bloc.state.password.isEmpty, true);
      expect(bloc.state.passwordCheck.isEmpty, true);
      expect(bloc.state.obscurePassword, true);
      expect(bloc.state.obscurePasswordCheck, true);
    });

    blocTest(
      "should emit new password when RegisterPasswordChanged add",
      build: () => bloc,
      act: (bloc) => bloc.add(RegisterPasswordChanged(password: "password")),
      expect: () => [RegisterPasswordState(password: 'password')],
    );

    blocTest(
      "should emit new password when RegisterPasswordCheckChanged add",
      build: () => bloc,
      act: (bloc) =>
          bloc.add(RegisterPasswordCheckChanged(password: "password")),
      expect: () => [RegisterPasswordState(passwordCheck: 'password')],
    );

    blocTest(
      "should emit invert obscure value when ObscurePasswordToggled add",
      build: () => bloc,
      act: (bloc) => bloc.add(ObscurePasswordToggled()),
      expect: () => [RegisterPasswordState(obscurePassword: false)],
    );

    blocTest(
      "should emit invert obscure value when ObscurePasswordCheckToggled add",
      build: () => bloc,
      act: (bloc) => bloc.add(ObscurePasswordCheckToggled()),
      expect: () => [RegisterPasswordState(obscurePasswordCheck: false)],
    );
  });
}
