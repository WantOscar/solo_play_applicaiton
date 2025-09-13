import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/user_logout_usecase.dart';
import 'package:solo_play_application/src/features/auth/domain/usecases/watch_user_access_token_usecase.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_state.dart';
import 'package:test/test.dart';

// WatchUserAccessTokenUseCase의 Mock 생성
class MockWatchUserAccessTokenUseCase extends Mock
    implements WatchUserAccessTokenUseCase {}

class MockUserLogoutUsecase extends Mock implements UserLogoutUsecase {}

void main() {
  group(AuthBloc, () {
    late AuthBloc authBloc;
    late MockWatchUserAccessTokenUseCase mockWatchUserAccessTokenUseCase;
    late MockUserLogoutUsecase mockUserLogoutUsecase;

    setUp(() {
      mockWatchUserAccessTokenUseCase = MockWatchUserAccessTokenUseCase();
      mockUserLogoutUsecase = MockUserLogoutUsecase();
      // when(() => mockWatchUserAccessTokenUseCase.call()).thenAnswer(
      //   (_) => Stream.fromIterable([
      //     AuthenticateStatus.unknown,
      //     AuthenticateStatus.authenticated,
      //     AuthenticateStatus.unauthenticated,
      //   ]),
      // );

      authBloc = AuthBloc(
          watchUserAccessTokenUseCase: mockWatchUserAccessTokenUseCase,
          userLogoutUsecase: mockUserLogoutUsecase);
    });

    tearDown(() {
      authBloc.close();
    });

    test('initial state is unknown', () {
      // AuthBloc의 초기 상태가 AuthenticateStatus.unknown인지 확인
      expect(authBloc.state, const Unknown(status: AuthenticateStatus.unknown));
    });

    blocTest<AuthBloc, AuthState>(
      'emits [authenticated] when auth status stream emits [authenticated]',
      build: () {
        when(
          () => mockWatchUserAccessTokenUseCase.call(),
        ).thenAnswer((_) => Stream.value(AuthenticateStatus.authenticated));
        return authBloc;
      },
      act: (bloc) {
        // AuthSubscriptionRequested 이벤트를 발생시켜 스트림 구독 시작
        bloc.add(const AuthSubscriptionRequested());
      },
      // AuthBloc의 상태가 AuthState(status: AuthenticateStatus.authenticated)로 변경될 것을 기대
      expect: () =>
          [const Authenticated(status: AuthenticateStatus.authenticated)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [unauthenticated] when auth status stream emits [unauthenticated]',
      build: () {
        when(
          () => mockWatchUserAccessTokenUseCase.call(),
        ).thenAnswer((_) => Stream.value(AuthenticateStatus.unauthenticated));
        return authBloc;
      },
      act: (bloc) {
        // AuthSubscriptionRequested 이벤트를 발생시켜 스트림 구독 시작
        bloc.add(const AuthSubscriptionRequested());
      },
      // AuthBloc의 상태가 AuthState(status: AuthenticateStatus.unauthenticated)로 변경될 것을 기대
      expect: () =>
          [const Unauthenticated(status: AuthenticateStatus.unauthenticated)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits a sequence of states based on the auth status stream',
      build: () {
        when(
          () => mockWatchUserAccessTokenUseCase.call(),
        ).thenAnswer((_) => Stream.fromIterable([
              AuthenticateStatus.unknown,
              AuthenticateStatus.unauthenticated,
              AuthenticateStatus.authenticated,
            ]));
        return authBloc;
      },
      act: (bloc) {
        bloc.add(const AuthSubscriptionRequested());
      },
      // AuthBloc의 상태가 스트림 시퀀스에 따라 순서대로 변경될 것을 기대
      expect: () => [
        const Unknown(status: AuthenticateStatus.unknown),
        const Unauthenticated(status: AuthenticateStatus.unauthenticated),
        const Authenticated(status: AuthenticateStatus.authenticated),
      ],
    );
  });
}
