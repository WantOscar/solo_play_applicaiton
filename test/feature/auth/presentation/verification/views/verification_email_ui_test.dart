import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/register/bloc/register_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

import 'package:solo_play_application/src/features/auth/presentation/verification/views/verification_email_ui.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_email_header.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_code_input_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/resend_email_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_confirm_button_section.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';

import '../mocks/mock_verification_bloc.dart';
import '../mocks/mock_timer_bloc.dart';
import '../mocks/mock_register_bloc.dart';

void main() {
  group(VerificationEmailUi, () {
    late MockVerificationBloc mockVerificationBloc;
    late MockTimerBloc mockTimerBloc;
    late MockRegisterBloc mockRegisterBloc;

    setUp(() {
      mockVerificationBloc = MockVerificationBloc();
      mockTimerBloc = MockTimerBloc();
      mockRegisterBloc = MockRegisterBloc();
    });

    testWidgets('displays all sections with correct layout and padding',
        (WidgetTester tester) async {
      whenListen(mockVerificationBloc,
          Stream.fromIterable([const VerificationState()]),
          initialState: const VerificationState());
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600));
      whenListen(mockRegisterBloc, Stream.fromIterable([const RegisterState()]),
          initialState: const RegisterState());

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<VerificationBloc>.value(
                value: mockVerificationBloc,
              ),
              BlocProvider<TimerBloc>.value(
                value: mockTimerBloc,
              ),
              BlocProvider<RegisterBloc>.value(
                value: mockRegisterBloc,
              ),
            ],
            child: const VerificationEmailUi(),
          ),
        ),
      );

      // Check for Scaffold
      expect(find.byType(Scaffold), findsOneWidget);

      // Check for Padding
      final paddingFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Padding &&
            widget.padding ==
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62.0),
      );
      expect(paddingFinder, findsOneWidget);

      // Check for all sections
      expect(find.byType(VerificationEmailHeader), findsOneWidget);
      expect(find.byType(VerificationCodeInputSection), findsOneWidget);
      expect(find.byType(ResendEmailSection), findsOneWidget);
      expect(find.byType(VerificationConfirmButtonSection), findsOneWidget);

      // Golden test
      await expectLater(
        find.byType(VerificationEmailUi),
        matchesGoldenFile('goldens/verification-email-ui.png'),
      );
    });
  });
}
