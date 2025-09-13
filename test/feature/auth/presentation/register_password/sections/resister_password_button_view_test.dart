import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/sections/register_password_button_view.dart';

import '../mocks/mock_register_password_bloc.dart';

void main() {
  group(RegisterPasswordButtonView, () {
    late MockRegisterPasswordBloc mockBloc;
    late Widget widget;

    setUp(() {
      mockBloc = MockRegisterPasswordBloc();
      when(() => mockBloc.state).thenReturn(RegisterPasswordState());
      widget = MaterialApp(
        home: Scaffold(
          body: BlocProvider<RegisterPasswordBloc>.value(
            value: mockBloc,
            child: RegisterPasswordButtonView(),
          ),
        ),
      );
    });

    testWidgets("should render button with correct label", (tester) async {
      await tester.pumpWidget(widget);

      expect(find.text("다음"), findsOneWidget);
    });

    testWidgets("should be disabled when form is invalid", (tester) async {
      when(() => mockBloc.state).thenReturn(RegisterPasswordState());
      await tester.pumpWidget(widget);

      final button = find.byType(GestureDetector);
      expect(button, findsOneWidget);

      final gestureDetector = tester.widget<GestureDetector>(button);
      expect(gestureDetector.onTap, isNull);
    });

    testWidgets("should be enabled when form is valid", (tester) async {
      when(() => mockBloc.state).thenReturn(
        RegisterPasswordState(
          password: "ValidPassword123!",
          passwordCheck: "ValidPassword123!",
        ),
      );
      await tester.pumpWidget(widget);

      final button = find.byType(GestureDetector);
      expect(button, findsOneWidget);

      final gestureDetector = tester.widget<GestureDetector>(button);
      expect(gestureDetector.onTap, isNotNull);
    });

    testWidgets("should render correctly when disabled", (tester) async {
      when(() => mockBloc.state).thenReturn(RegisterPasswordState());
      await tester.pumpWidget(widget);

      expectLater(
          find.byType(RegisterPasswordButtonView),
          matchesGoldenFile(
              'goldens/resister-password-button-view-disabled.png'));
    });

    testWidgets("should render correctly when enabled", (tester) async {
      when(() => mockBloc.state).thenReturn(
        RegisterPasswordState(
          password: "ValidPassword123!",
          passwordCheck: "ValidPassword123!",
        ),
      );
      await tester.pumpWidget(widget);

      expectLater(
          find.byType(RegisterPasswordButtonView),
          matchesGoldenFile(
              'goldens/resister-password-button-view-enabled.png'));
    });
  });
}
