import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/go_router_refresh_stream.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/bloc/auth_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/page/login_page.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/views/register_flow.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/page/register_password_page.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_agreement/page/user_agreement_page.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/page/register_email_page.dart';

GoRouter router(AuthBloc authBloc) {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  return GoRouter(
    initialLocation: RouterPath.splash,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authStatus = context.read<AuthBloc>().state.status;
      // 로그인과 회원가입 경로를 모두 '공개된(public)' 경로로 취급합니다.
      final currentLocation = state.matchedLocation;
      final isGoingToPublic = currentLocation == RouterPath.login ||
          currentLocation.startsWith("/register");

      // 1. 인증되지 않은 상태에서 공개 페이지(로그인/회원가입)가 아닌 곳으로 가려고 할 때
      if (authStatus != AuthenticateStatus.authenticated && !isGoingToPublic) {
        return RouterPath.login;
      }

      // 2. 인증된 상태에서 로그인/회원가입 페이지로 가려고 할 때
      if (authStatus == AuthenticateStatus.authenticated && isGoingToPublic) {
        return RouterPath.home;
      }
      return null;
    },
    routes: [
      GoRoute(
        name: RouterPath.splash,
        path: RouterPath.splash,
        builder: (context, state) => Scaffold(
          body: Center(
            child: Text("splash"),
          ),
        ),
      ),
      GoRoute(
        name: RouterPath.home,
        path: RouterPath.home,
        builder: (context, state) => Scaffold(
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutTapped());
                },
                child: Text("로그아웃")),
          ),
        ),
      ),
      GoRoute(
        name: RouterPath.login,
        path: RouterPath.login,
        builder: (context, state) => LoginPage(),
      ),
      ShellRoute(
          navigatorKey: rootNavigatorKey,
          builder: (context, state, child) => RegisterFlow(child: child),
          routes: [
            GoRoute(
              name: RouterPath.registerTerms,
              path: RouterPath.registerTerms,
              builder: (context, state) => UserAgreementPage(),
            ),
            GoRoute(
              name: RouterPath.registerEmail,
              path: RouterPath.registerEmail,
              builder: (context, state) => RegisterEmailPage(),
            ),
            GoRoute(
              name: RouterPath.registerPassword,
              path: RouterPath.registerPassword,
              builder: (context, state) => RegisterPasswordPage(),
            ),
          ]),
    ],
  );
}
