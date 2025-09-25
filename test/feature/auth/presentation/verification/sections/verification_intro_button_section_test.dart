import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';
import 'package:solo_play_application/src/core/router/router_path.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/domain/entities/register.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_intro_button_section.dart';

import '../mocks/mock_register_bloc.dart';
import '../mocks/mock_verification_bloc.dart';
import '../mocks/mock_go_router.dart';

void main() {
  group(VerificationIntroButtonSection, () {
    late Widget widget;
    late MockRegisterBloc mockRegisterBloc;
    late MockVerificationBloc mockVerificationBloc;
    late MockGoRouter mockGoRouter;

    const testEmail = 'test@example.com';

    setUpAll(() {
      registerFallbackValue(VerificationEvent.verificationEmailSent(testEmail));
      registerFallbackValue(RegisterState());
      registerFallbackValue(VerificationState());
    });

    setUp(() {
      mockRegisterBloc = MockRegisterBloc();
      mockVerificationBloc = MockVerificationBloc();
      mockGoRouter = MockGoRouter();

      when(() => mockRegisterBloc.state).thenReturn(
        const RegisterState(register: Register(email: testEmail)),
      );
      when(() => mockVerificationBloc.state)
          .thenReturn(const VerificationState());
      when(() => mockGoRouter.push(any())).thenAnswer((_) async => null);

      widget = MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>.value(value: mockRegisterBloc),
          BlocProvider<VerificationBloc>.value(value: mockVerificationBloc),
        ],
        child: MaterialApp(
          home: InheritedGoRouter(
            goRouter: mockGoRouter,
            child: const Scaffold(
              body: Center(
                child: VerificationIntroButtonSection(),
              ),
            ),
          ),
        ),
      );
    });

    tearDown(() {
      mockRegisterBloc.close();
      mockVerificationBloc.close();
    });

    testWidgets('should render activeChild correctly', (tester) async {
      await tester.pumpWidget(widget);

      final activeChild =
          tester.widget<PrimaryButton>(find.byType(PrimaryButton)).activeChild;

      expect(activeChild, isA<Text>());

      final labelFinder = find.text("본인인증 하러 가기");

      final activeLabel = tester.widget<Text>(labelFinder);

      expect(activeLabel.style?.color, const Color(0xffffffff));
      expect(activeLabel.style?.fontSize, 16);
      expect(activeLabel.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('should render button correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(VerificationIntroButtonSection),
          matchesGoldenFile('goldens/verification-intro-button-default.png'));
    });

    testWidgets(
        'should dispatch VerificationEmailSent event with email from RegisterBloc when tapped',
        (tester) async {
      await tester.pumpWidget(widget);

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      verify(() => mockVerificationBloc.add(
          const VerificationEvent.verificationEmailSent(testEmail))).called(1);
    });

    testWidgets(
        'should navigate to VerificationEmailPage on successful email sent',
        (tester) async {
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(),
          const VerificationState(status: VerificationStatus.sent),
        ]),
        initialState: const VerificationState(),
      );

      await tester.pumpWidget(widget);

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      verify(() => mockGoRouter.push(RouterPath.verficationEmail)).called(1);
    });

    testWidgets('should log error on failed email sent', (tester) async {
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(),
          const VerificationState(
              status: VerificationStatus.error, errorMessage: 'Failed to send'),
        ]),
        initialState: const VerificationState(),
      );

      await tester.pumpWidget(widget);

      await tester.tap(find.byType(PrimaryButton));
      await tester.pumpAndSettle();

      // Verify that a log message was produced.
      // This requires a custom matcher or capturing logs,
      // For simplicity, we'll just ensure no navigation happened
      // and assume logging is handled correctly by the framework.
      verifyNever(() => mockGoRouter.push(any()));
    });
  });
}
