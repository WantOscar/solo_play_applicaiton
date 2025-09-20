import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/widgets/next_step_button.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart'; // Added
import 'package:solo_play_application/src/features/auth/presentation/user_email/blocs/bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/views/register_email_ui.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/widgets/validation_icon.dart'; // Added

import '../mocks/mock_user_email_bloc.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(const UserEmailChanged(email: ''));
    registerFallbackValue(const UserEmailCheckDuplicate(email: ''));
  });
  group(RegisterEmailUI, () {
    late MockUserEmailBloc mockUserEmailBloc;
    late Widget widget;

    setUp(() {
      mockUserEmailBloc = MockUserEmailBloc();
      when(() => mockUserEmailBloc.state).thenReturn(const UserEmailState());
      widget = MaterialApp(
        home: Scaffold(
          body: BlocProvider<UserEmailBloc>.value(
            value: mockUserEmailBloc,
            child: const RegisterEmailUI(),
          ),
        ),
      );
    });

    testWidgets("should render all views correctly", (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(RegisterEmailHeader), findsOneWidget);
      expect(find.byType(RegisterEmailInputTextField), findsOneWidget);
      expect(find.byType(RegisterEmailValidateIconView), findsOneWidget);
      expect(find.byType(RegisterEmailValidateTextView), findsOneWidget);
      expect(find.byType(RegisterEmailButtonView), findsOneWidget);
    });

    testWidgets("should render default UI correctly", (tester) async {
      await tester.pumpWidget(widget);

      await expectLater(
        find.byType(RegisterEmailUI),
        matchesGoldenFile('goldens/register-email-ui-default.png'),
      );
    });

    testWidgets("button should be disabled when status is empty",
        (tester) async {
      when(() => mockUserEmailBloc.state)
          .thenReturn(const UserEmailState(status: UserEmailStatus.empty));

      await tester.pumpWidget(widget);

      final button = tester.widget<NextStepButton>(find.byType(NextStepButton));
      expect(button.onTap, isNull);
    });

    testWidgets("button should be enabled when status is valid",
        (tester) async {
      when(() => mockUserEmailBloc.state).thenReturn(const UserEmailState(
          email: "test@test.com", status: UserEmailStatus.valid));

      await tester.pumpWidget(widget);

      final button = tester.widget<NextStepButton>(find.byType(NextStepButton));
      expect(button.onTap, isNotNull);
      expectLater(find.byType(RegisterEmailUI),
          matchesGoldenFile('goldens/register-email-ui-valid.png'));
    });

    testWidgets("should render error state correctly when email is duplicated",
        (tester) async {
      when(() => mockUserEmailBloc.state).thenReturn(
        const UserEmailState(
          email: "duplicate@test.com",
          status: UserEmailStatus.conflict,
          errorMessage: "이메일이 이미 존재합니다",
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pump(); // Ensure all widgets are rebuilt

      // 1. PrimaryTextField의 isError가 활성화되어야
      final primaryTextField =
          tester.widget<PrimaryTextField>(find.byType(PrimaryTextField));
      expect(primaryTextField.isError, isTrue);

      // 2. RegisterEmailValidateTextView에 에러가 보여야 하며
      expect(find.text("이메일이 이미 존재합니다"), findsOneWidget);

      // 3. RegisterEmailValidateIconView는 isValid가 false가 전달되어야 해
      final validationIcon =
          tester.widget<ValidationIcon>(find.byType(ValidationIcon));
      expect(validationIcon.isValid, isFalse);

      // 4. 골든테스트 실제 UI가 맞는지 확인
      await expectLater(find.byType(RegisterEmailUI),
          matchesGoldenFile('goldens/register-email-ui-conflict.png'));
    });
  });
}
