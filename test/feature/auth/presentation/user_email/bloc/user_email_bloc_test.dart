import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/check_email_duplicate_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';

class MockCheckEmailDuplicateUsecase extends Mock
    implements CheckEmailDuplicateUsecase {}

void main() {
  group(UserEmailBloc, () {
    final email = "test@test.com";
    final invalidEmail = "testcom";

    late MockCheckEmailDuplicateUsecase checkEmailDuplicateUsecase;

    late UserEmailBloc userEmailBloc;
    setUp(() {
      checkEmailDuplicateUsecase = MockCheckEmailDuplicateUsecase();
      userEmailBloc =
          UserEmailBloc(checkEmailDuplicateUsecase: checkEmailDuplicateUsecase);
    });

    test('should return initial state correctly', () {
      expect(userEmailBloc.state.email.isEmpty, true);
      expect(userEmailBloc.state.errorMessage.isEmpty, true);
      expect(userEmailBloc.state.status, UserEmailStatus.empty);
    });

    blocTest(
        'emits with new email and valid status when UserEmailChanged added',
        build: () => userEmailBloc,
        act: (bloc) => bloc.add(UserEmailChanged(email: email)),
        expect: () =>
            [UserEmailState(email: email, status: UserEmailStatus.valid)]);

    blocTest('emits with new email and invalid when UserEmailChanged added',
        build: () => userEmailBloc,
        act: (bloc) => bloc.add(UserEmailChanged(email: invalidEmail)),
        expect: () => [
              UserEmailState(
                  email: invalidEmail, status: UserEmailStatus.invalid)
            ]);

    blocTest(
        'emits state with email and success message when UserEmailCheckDuplicate is added and usecase succeeds',
        build: () {
          when(
            () => checkEmailDuplicateUsecase.call(email),
          ).thenAnswer((_) async => Success("사용 가능한 이메일입니다!"));
          return userEmailBloc;
        },
        act: (bloc) {
          bloc.add(UserEmailCheckDuplicate(email: email));
        },
        expect: () => [UserEmailState(status: UserEmailStatus.avail)],
        verify: (_) {
          verify(
            () => checkEmailDuplicateUsecase.call(email),
          ).called(1);
        });

    blocTest(
      "emits state with email and failure message when UserEmailCheckDuplicate is added and usecase failed",
      build: () {
        when(
          () => checkEmailDuplicateUsecase.call(email),
        ).thenAnswer((_) async => Failure("이미 있는 아이디에요."));
        return userEmailBloc;
      },
      act: (bloc) => bloc.add(UserEmailCheckDuplicate(email: email)),
      expect: () => [
        UserEmailState(
            status: UserEmailStatus.conflict, errorMessage: "이미 있는 아이디에요.")
      ],
      verify: (_) {
        verify(
          () => checkEmailDuplicateUsecase.call(email),
        ).called(1);
      },
    );
  });
}
