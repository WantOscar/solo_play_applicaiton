import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:go_router/go_router.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_confirm_button_section.dart';

import '../mocks/mock_verification_bloc.dart';
import '../mocks/mock_register_bloc.dart';
import '../mocks/mock_go_router.dart';

void main() {
  group(VerificationConfirmButtonSection, () {
    late MockVerificationBloc mockVerificationBloc;
    late MockRegisterBloc mockRegisterBloc;
    late MockGoRouter mockGoRouter;

    setUpAll(() {
      registerFallbackValue(VerificationEvent.verificationSubmitted('', ''));
      registerFallbackValue(RegisterState());
      registerFallbackValue(Uri.parse('/'));
      registerFallbackValue(
          RegisterEvent.registerSubmitted(email: '', password: ''));
    });

    setUp(() {
      mockVerificationBloc = MockVerificationBloc();
      mockRegisterBloc = MockRegisterBloc();
      mockGoRouter = MockGoRouter();
      when(() => mockRegisterBloc.add(any())).thenReturn(null);
      when(() => mockRegisterBloc.state).thenReturn(const RegisterState());
    });

    testWidgets('displays disabled button when input is less than 6 characters',
        (WidgetTester tester) async {
      whenListen(mockVerificationBloc,
          Stream.fromIterable([const VerificationState(code: '12345')]),
          initialState:
              const VerificationState(code: '12345')); // Simulate code input

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                    value: mockVerificationBloc),
                BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
              ],
              child: const VerificationConfirmButtonSection(),
            ),
          ),
        ),
      );

      // Check for PrimaryButton
      final buttonFinder = find.byType(PrimaryButton);
      expect(buttonFinder, findsOneWidget);

      // Assert the label text of the button
      expect(find.text('다음'), findsOneWidget);

      // Assert the button is disabled (onTap is null)
      final PrimaryButton button = tester.widget(buttonFinder);
      expect(button.onTap, isNull);

      // Assert the style of the button's text when disabled
      final Text buttonText = tester.widget(
          find.descendant(of: buttonFinder, matching: find.byType(Text)));
      expect(buttonText.style!.color, const Color(0xff8e8e8e));
      expect(buttonText.style!.fontSize, 16);
      expect(buttonText.style!.fontWeight, FontWeight.w700);

      // Golden test for disabled state
      await expectLater(
        find.byType(VerificationConfirmButtonSection),
        matchesGoldenFile(
            'goldens/verification_confirm_button_section_disabled.png'),
      );
    });

    testWidgets('displays enabled button when input is 6 characters',
        (WidgetTester tester) async {
      whenListen(mockVerificationBloc,
          Stream.fromIterable([const VerificationState(code: '123456')]),
          initialState:
              const VerificationState(code: '123456')); // Simulate code input

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                    value: mockVerificationBloc),
                BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
              ],
              child: const VerificationConfirmButtonSection(),
            ),
          ),
        ),
      );

      // Check for PrimaryButton
      final buttonFinder = find.byType(PrimaryButton);
      expect(buttonFinder, findsOneWidget);

      // Assert the label text of the button
      expect(find.text('다음'), findsOneWidget);

      // Assert the button is enabled (onTap is not null)
      final PrimaryButton button = tester.widget(buttonFinder);
      expect(button.onTap, isNotNull);

      // Assert the style of the button's text when enabled
      final Text buttonText = tester.widget(
          find.descendant(of: buttonFinder, matching: find.byType(Text)));
      expect(buttonText.style!.color, const Color(0xffffffff));
      expect(buttonText.style!.fontSize, 16);
      expect(buttonText.style!.fontWeight, FontWeight.w700);

      // Golden test for enabled state
      await expectLater(
        find.byType(VerificationConfirmButtonSection),
        matchesGoldenFile(
            'goldens/verification_confirm_button_section_enabled.png'),
      );
    });

    testWidgets(
        'dispatches VerificationSubmitted event when enabled button is tapped',
        (WidgetTester tester) async {
      // Arrange
      const testEmail = 'test@example.com';
      const testCode = '123456';
      const testPassword = 'password';

      when(() => mockVerificationBloc.state)
          .thenReturn(const VerificationState(code: testCode));
      when(() => mockRegisterBloc.state).thenReturn(RegisterState(
          register: Register(email: testEmail, password: testPassword)));
      when(() => mockVerificationBloc.add(any())).thenReturn(null);
      // when(() => mockRegisterBloc.add(any())).thenReturn(null); // setUp에서 처리

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
              BlocProvider<VerificationBloc>.value(value: mockVerificationBloc),
            ],
            child: const Scaffold(
              body: VerificationConfirmButtonSection(),
            ),
          ),
        ),
      );

      // Act
      final buttonFinder = find.byType(PrimaryButton);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockVerificationBloc.add(
              VerificationEvent.verificationSubmitted(testEmail, testCode)))
          .called(1);
      // verify(() => mockRegisterBloc.add(any(that: isA<RegisterSubmitted>()))) // 이 라인 제거
      //     .called(1);
    });

    testWidgets(
        'navigates to verificationComplete when verification and registration are successful',
        (WidgetTester tester) async {
      // Arrange
      const testEmail = 'test@example.com';
      const testPassword = 'password';

      // VerificationBloc이 verified 상태를 방출하도록 설정
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(
              status: VerificationStatus.verified, code: '123456'),
        ]),
        initialState: const VerificationState(code: '123456'),
      );

      // RegisterBloc의 초기 상태 설정
      when(() => mockRegisterBloc.state).thenReturn(RegisterState(
          register: Register(email: testEmail, password: testPassword)));

      // RegisterBloc이 RegisterSubmitted 이벤트를 받았을 때 success 상태를 방출하도록 설정
      whenListen(
        mockRegisterBloc,
        Stream.fromIterable([
          RegisterState(
            register: Register(email: testEmail, password: testPassword),
            status: RegisterStatus.loading,
          ),
          RegisterState(
            register: Register(email: testEmail, password: testPassword),
            status: RegisterStatus.success,
          ),
        ]),
        initialState: RegisterState(
            register: Register(email: testEmail, password: testPassword)),
      );

      when(() => mockGoRouter.push(any())).thenAnswer((_) async => '');

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
              BlocProvider<VerificationBloc>.value(value: mockVerificationBloc),
            ],
            child: InheritedGoRouter(
              goRouter: mockGoRouter,
              child: const Scaffold(
                body: VerificationConfirmButtonSection(),
              ),
            ),
          ),
        ),
      );

      // Act - VerificationBloc의 verified 상태가 트리거되고, RegisterBloc의 success 상태가 트리거될 때까지 기다림
      await tester.pumpAndSettle();

      // Assert
      verify(() => mockRegisterBloc
              .add(any(that: isA<RegisterSubmitted>()))) // 추가된 부분
          .called(1);
      verify(() => mockGoRouter.push(RouterPath.verificationComplete))
          .called(1);
    });

    testWidgets('logs error message when status is error',
        (WidgetTester tester) async {
      // Arrange
      const errorMessage = 'Test error message';
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(
              status: VerificationStatus.error, errorMessage: errorMessage),
        ]),
        initialState: const VerificationState(),
      );
      when(() => mockRegisterBloc.state).thenReturn(
          const RegisterState(register: Register(email: 'test@example.com')));

      // We can't directly test `log` from dart:developer in widget tests easily.
      // Instead, we'll verify that the listener is triggered by checking for no navigation.
      when(() => mockGoRouter.push(any())).thenAnswer((_) async => '');

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
              BlocProvider<VerificationBloc>.value(value: mockVerificationBloc),
            ],
            child: InheritedGoRouter(
              goRouter: mockGoRouter,
              child: const Scaffold(
                body: VerificationConfirmButtonSection(),
              ),
            ),
          ),
        ),
      );

      // Act - No direct interaction needed, just pump to trigger listener
      await tester.pumpAndSettle();

      // Assert that no navigation occurred (as expected for an error state)
      verifyNever(() => mockGoRouter.push(any()));
      // In a real scenario, you might use a custom logger that can be mocked
      // or capture debugPrint output if `log` was redirected to it.
    });
  });
}
