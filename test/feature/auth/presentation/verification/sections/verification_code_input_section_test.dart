import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';

import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_code_input_section.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart'; // Import TimerState

import '../mocks/mock_timer_bloc.dart';
import '../mocks/mock_verification_bloc.dart';

void main() {
  group(VerificationCodeInputSection, () {
    late MockVerificationBloc mockVerificationBloc;
    late MockTimerBloc mockTimerBloc;

    setUp(() {
      mockVerificationBloc = MockVerificationBloc();
      mockTimerBloc = MockTimerBloc();
    });

    testWidgets('should render text and PrimaryTextField correctly',
        (WidgetTester tester) async {
      whenListen(mockVerificationBloc,
          Stream.fromIterable([const VerificationState()]),
          initialState: const VerificationState()); // Initial state for Cubit
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600)); // Initial state for TimerBloc

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                  value: mockVerificationBloc,
                ),
                BlocProvider<TimerBloc>.value(
                  value: mockTimerBloc,
                ),
              ],
              child: const VerificationCodeInputSection(),
            ),
          ),
        ),
      );

      // Find the VerificationCodeInputSection widget
      final sectionFinder = find.byType(VerificationCodeInputSection);
      expect(sectionFinder, findsOneWidget);

      // Check for Column
      final columnFinder =
          find.descendant(of: sectionFinder, matching: find.byType(Column));
      expect(columnFinder, findsOneWidget);
      final column = tester.widget<Column>(columnFinder);
      expect(column.crossAxisAlignment, CrossAxisAlignment.start);

      // Check for the Text widget
      final textFinder = find.text('인증코드를 입력해주세요.');
      expect(textFinder, findsOneWidget);

      // Check for SizedBox
      final sizedBox1 = column.children[1] as SizedBox;
      expect(sizedBox1.height, 6);

      // Check for PrimaryTextField
      final textFieldFinder = find.byType(PrimaryTextField);
      expect(textFieldFinder, findsOneWidget);
      final primaryTextField = tester.widget<PrimaryTextField>(textFieldFinder);
      expect(primaryTextField.hintText, '123456');
      expect(primaryTextField.keyboardType,
          const TextInputType.numberWithOptions());

      // Check for SizedBox between text field and timer
      final sizedBox2 = column.children[3] as SizedBox;
      expect(sizedBox2.height, 6);

      // Check for TimerView
      expect(find.byType(TimerView), findsOneWidget);

      // Simulate text input and verify Cubit update
      await tester.enterText(textFieldFinder, '123');
      await tester.pump();
      verify(() =>
              mockVerificationBloc.add(const VerificationCodeChanged('123')))
          .called(1);

      // Golden test
      await expectLater(
        find.byType(VerificationCodeInputSection),
        matchesGoldenFile('goldens/verification_code_input_section.png'),
      );
    });

    testWidgets('should unfocus when code length reaches 6',
        (WidgetTester tester) async {
      // Arrange
      whenListen(mockVerificationBloc,
          Stream.fromIterable([const VerificationState()]),
          initialState: const VerificationState());
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                  value: mockVerificationBloc,
                ),
                BlocProvider<TimerBloc>.value(
                  value: mockTimerBloc,
                ),
              ],
              child: const VerificationCodeInputSection(),
            ),
          ),
        ),
      );

      final textFieldFinder = find.byType(PrimaryTextField);
      expect(textFieldFinder, findsOneWidget);

      // Give focus to the text field
      await tester.tap(textFieldFinder);
      await tester.pump();

      // Get the focus node of the text field
      final focusNode = FocusManager.instance.primaryFocus;
      expect(focusNode, isNotNull);
      expect(focusNode?.hasFocus, isTrue);

      // Act: Enter 6 characters
      await tester.enterText(textFieldFinder, '123456');
      await tester.pump();

      // Assert: Cubit is updated
      verify(() =>
              mockVerificationBloc.add(const VerificationCodeChanged('123456')))
          .called(1);

      // Assert: The text field should have lost focus
      expect(focusNode?.hasFocus, isFalse);
    });

    testWidgets(
        'should show error message and activate isError when state is error',
        (WidgetTester tester) async {
      const errorMessage = 'Invalid code';
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(
              status: VerificationStatus.error, errorMessage: errorMessage)
        ]),
        initialState: const VerificationState(
            status: VerificationStatus.error, errorMessage: errorMessage),
      );
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                  value: mockVerificationBloc,
                ),
                BlocProvider<TimerBloc>.value(
                  value: mockTimerBloc,
                ),
              ],
              child: const VerificationCodeInputSection(),
            ),
          ),
        ),
      );

      await tester.pump(); // Rebuild the widget with the new state

      // Check for error message
      expect(find.text(errorMessage), findsOneWidget);

      // Check if PrimaryTextField has isError set to true
      final textField =
          tester.widget<PrimaryTextField>(find.byType(PrimaryTextField));
      expect(textField.isError, isTrue);
    });

    testWidgets('should clear error when typing starts',
        (WidgetTester tester) async {
      const errorMessage = 'Invalid code';
      whenListen(
        mockVerificationBloc,
        Stream.fromIterable([
          const VerificationState(
              status: VerificationStatus.error, errorMessage: errorMessage),
          const VerificationState(status: VerificationStatus.initial)
        ]),
        initialState: const VerificationState(
            status: VerificationStatus.error, errorMessage: errorMessage),
      );
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600));

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationBloc>.value(
                  value: mockVerificationBloc,
                ),
                BlocProvider<TimerBloc>.value(
                  value: mockTimerBloc,
                ),
              ],
              child: const VerificationCodeInputSection(),
            ),
          ),
        ),
      );

      // Initially, error is shown
      expect(find.text(errorMessage), findsOneWidget);
      final initialTextField =
          tester.widget<PrimaryTextField>(find.byType(PrimaryTextField));
      expect(initialTextField.isError, isTrue);

      // Simulate typing
      await tester.enterText(find.byType(PrimaryTextField), '1');
      await tester.pumpAndSettle();

      // Verify that the error clear event was dispatched
      verify(() => mockVerificationBloc.add(const VerificationCodeChanged('1')))
          .called(1);
    });
  });
}
