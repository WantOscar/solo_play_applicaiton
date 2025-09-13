import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/login_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/bloc/login_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/sections/login_ui_error_message_section.dart';

import '../../../../../core/mocks/mocks.dart';

void main() {
  group(LoginUiErrorMessageSection, () {
    late MockLoginBloc mockLoginBloc;
    late Widget widget;

    setUp(() {
      mockLoginBloc = MockLoginBloc();
      widget = MaterialApp(
        home: BlocProvider<LoginBloc>.value(
          value: mockLoginBloc,
          child: Scaffold(
            body: Center(
              child: LoginUiErrorMessageSection(),
            ),
          ),
        ),
      );
    });

    testWidgets('should render correctly when errorMessage is Empty',
        (tester) async {
      when(() => mockLoginBloc.state).thenReturn(LoginState(errorMessage: ''));
      await tester.pumpWidget(widget);

      expect(
          find.byType(LoginUiErrorMessageSection),
          matchesGoldenFile(
              'goldens/login-ui-error-message-section-default.png'));
    });

    testWidgets('should render correctly when errorMessage is not empty',
        (tester) async {
      when(() => mockLoginBloc.state)
          .thenReturn(LoginState(errorMessage: 'error'));
      await tester.pumpWidget(widget);

      expect(find.text('error'), findsOneWidget);

      expect(
          find.byType(LoginUiErrorMessageSection),
          matchesGoldenFile(
              'goldens/login-ui-error-message-section-error.png'));
    });
  });
}
