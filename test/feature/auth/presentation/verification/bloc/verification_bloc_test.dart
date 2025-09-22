import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/utils/networks/result.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/send_verification_email_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_verify_code_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

class MockSendVerificationEmailUsecase extends Mock
    implements SendVerificationEmailUsecase {}

class MockUserVerifyCodeUsecase extends Mock implements UserVerifyCodeUsecase {}

void main() {
  group(VerificationBloc, () {
    late VerificationBloc verificationBloc;
    late MockSendVerificationEmailUsecase mockSendVerificationEmailUsecase;
    late MockUserVerifyCodeUsecase mockUserVerifyCodeUsecase;

    setUp(() {
      mockSendVerificationEmailUsecase = MockSendVerificationEmailUsecase();
      mockUserVerifyCodeUsecase = MockUserVerifyCodeUsecase();
      verificationBloc = VerificationBloc(
        sendVerificationEmailUsecase: mockSendVerificationEmailUsecase,
        userVerifyCodeUsecase: mockUserVerifyCodeUsecase,
      );
    });

    test('initial state is VerificationState()', () {
      expect(verificationBloc.state, const VerificationState());
    });

    blocTest<VerificationBloc, VerificationState>(
      'emits [VerificationState(code: \'123\')] when VerificationCodeChanged is added.',
      build: () => verificationBloc,
      act: (bloc) => bloc.add(const VerificationCodeChanged('123')),
      expect: () => [const VerificationState(code: '123')],
    );

    group('VerificationEmailSent', () {
      const email = 'test@test.com';

      blocTest<VerificationBloc, VerificationState>(
        'emits [sending, sent] states for successful email sending',
        build: () {
          when(() => mockSendVerificationEmailUsecase.call(email))
              .thenAnswer((_) async => const Result.success(''));
          return verificationBloc;
        },
        act: (bloc) => bloc.add(const VerificationEmailSent(email)),
        expect: () => [
          const VerificationState(status: VerificationStatus.sending),
          const VerificationState(status: VerificationStatus.sent),
        ],
        verify: (_) {
          verify(() => mockSendVerificationEmailUsecase.call(email)).called(1);
        },
      );

      blocTest<VerificationBloc, VerificationState>(
        'emits [sending, error] states for usecase failure',
        build: () {
          when(() => mockSendVerificationEmailUsecase.call(email))
              .thenAnswer((_) async => const Result.failure('Test Failure'));
          return verificationBloc;
        },
        act: (bloc) => bloc.add(const VerificationEmailSent(email)),
        expect: () => [
          const VerificationState(status: VerificationStatus.sending),
          const VerificationState(
              status: VerificationStatus.error, errorMessage: 'Test Failure'),
        ],
        verify: (_) {
          verify(() => mockSendVerificationEmailUsecase.call(email)).called(1);
        },
      );
    });

    group('VerificationSubmitted', () {
      const email = 'test@test.com';
      const code = '123456';

      blocTest<VerificationBloc, VerificationState>(
        'emits [verifying, verified] states for successful code verification',
        build: () {
          when(() => mockUserVerifyCodeUsecase.call(email, code))
              .thenAnswer((_) async => const Result.success(''));
          return verificationBloc;
        },
        act: (bloc) => bloc.add(VerificationSubmitted(email, code)),
        expect: () => [
          const VerificationState(status: VerificationStatus.verifying),
          const VerificationState(status: VerificationStatus.verified),
        ],
        verify: (_) {
          verify(() => mockUserVerifyCodeUsecase.call(email, code)).called(1);
        },
      );

      blocTest<VerificationBloc, VerificationState>(
        'emits [verifying, error] states for usecase failure',
        build: () {
          when(() => mockUserVerifyCodeUsecase.call(email, code))
              .thenAnswer((_) async => const Result.failure('Test Failure'));
          return verificationBloc;
        },
        act: (bloc) => bloc.add(VerificationSubmitted(email, code)),
        expect: () => [
          const VerificationState(status: VerificationStatus.verifying),
          const VerificationState(
              status: VerificationStatus.error, errorMessage: 'Test Failure'),
        ],
        verify: (_) {
          verify(() => mockUserVerifyCodeUsecase.call(email, code)).called(1);
        },
      );
    });
  });
}
