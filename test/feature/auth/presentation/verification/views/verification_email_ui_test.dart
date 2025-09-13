import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:solo_play_application/src/features/auth/presentation/verification/views/verification_email_ui.dart'; // This file doesn't exist yet
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_email_header.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_code_input_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/resend_email_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_confirm_button_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_event.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';

class MockVerificationCodeCubit extends MockCubit<String>
    implements VerificationCodeCubit {}

class MockTimerBloc extends MockBloc<TimerEvent, TimerState>
    implements TimerBloc {}

void main() {
  group('VerificationEmailUi', () {
    late MockVerificationCodeCubit mockVerificationCodeCubit;
    late MockTimerBloc mockTimerBloc;

    setUp(() {
      mockVerificationCodeCubit = MockVerificationCodeCubit();
      mockTimerBloc = MockTimerBloc();
    });

    testWidgets('displays all sections with correct layout and padding',
        (WidgetTester tester) async {
      whenListen(mockVerificationCodeCubit, Stream.fromIterable(['']),
          initialState: '');
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600));

      await tester.pumpWidget(
        MaterialApp(
          home: MultiBlocProvider(
            providers: [
              BlocProvider<VerificationCodeCubit>.value(
                value: mockVerificationCodeCubit,
              ),
              BlocProvider<TimerBloc>.value(
                value: mockTimerBloc,
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

      // Check for Column with specific mainAxisAlignment
      final columnFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Column &&
            widget.mainAxisAlignment == MainAxisAlignment.spaceBetween,
        skipOffstage: false,
      );
      expect(columnFinder, findsOneWidget);
      final column = tester.widget<Column>(columnFinder);
      expect(
          column.crossAxisAlignment,
          CrossAxisAlignment
              .start); // Assuming start alignment for the main column

      // Check for all sections
      expect(find.byType(VerificationEmailHeader), findsOneWidget);
      expect(find.byType(VerificationCodeInputSection), findsOneWidget);
      expect(find.byType(ResendEmailSection), findsOneWidget);
      expect(find.byType(VerificationConfirmButtonSection), findsOneWidget);

      // Golden test
      await expectLater(
        find.byType(VerificationEmailUi),
        matchesGoldenFile('goldens/verification_email_ui.png'),
      );
    });
  });
}
