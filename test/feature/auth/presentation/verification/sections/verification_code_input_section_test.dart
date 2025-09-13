import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart'; // Import bloc_test
import 'package:mocktail/mocktail.dart'; // Import mocktail
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc

import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_code_input_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/cubits/verification_code_cubit.dart'; // Import Cubit
import 'package:solo_play_application/src/features/timer/bloc/timer_bloc.dart'; // Import TimerBloc
import 'package:solo_play_application/src/features/timer/bloc/timer_event.dart';
import 'package:solo_play_application/src/features/timer/bloc/timer_state.dart';
import 'package:solo_play_application/src/features/timer/presentation/views/timer_view.dart'; // Import TimerState

// Mock Cubit for testing
class MockVerificationCodeCubit extends MockCubit<String>
    implements VerificationCodeCubit {}

// Mock TimerBloc for testing
class MockTimerBloc extends MockBloc<TimerEvent, TimerState>
    implements TimerBloc {}

void main() {
  group('VerificationCodeInputSection', () {
    late MockVerificationCodeCubit mockVerificationCodeCubit;
    late MockTimerBloc mockTimerBloc;

    setUp(() {
      mockVerificationCodeCubit = MockVerificationCodeCubit();
      mockTimerBloc = MockTimerBloc();
    });

    testWidgets(
        'displays text and PrimaryTextField with correct properties and layout',
        (WidgetTester tester) async {
      whenListen(mockVerificationCodeCubit, Stream.fromIterable(['']),
          initialState: ''); // Initial state for Cubit
      whenListen(mockTimerBloc, Stream.fromIterable([const TimerInitial(600)]),
          initialState: const TimerInitial(600)); // Initial state for TimerBloc

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<VerificationCodeCubit>.value(
                  value: mockVerificationCodeCubit,
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
      expect(column.children.length,
          5); // Text, SizedBox, PrimaryTextField, SizedBox, TimerView

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
      expect(primaryTextField.keyboardType, TextInputType.number);

      // Check for SizedBox between text field and timer
      final sizedBox2 = column.children[3] as SizedBox;
      expect(sizedBox2.height, 6);

      // Check for TimerView
      expect(find.byType(TimerView), findsOneWidget);

      // Simulate text input and verify Cubit update
      await tester.enterText(textFieldFinder, '123');
      await tester.pump();
      verify(() => mockVerificationCodeCubit.updateCode('123')).called(1);

      // Golden test
      await expectLater(
        find.byType(VerificationCodeInputSection),
        matchesGoldenFile('goldens/verification_code_input_section.png'),
      );
    });
  });
}
