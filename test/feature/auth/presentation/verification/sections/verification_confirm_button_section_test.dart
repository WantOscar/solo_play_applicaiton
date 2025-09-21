import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_bloc.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_event.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/bloc/verification_state.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_confirm_button_section.dart';

// Mock Bloc for testing
class MockVerificationBloc
    extends MockBloc<VerificationEvent, VerificationState>
    implements VerificationBloc {}

void main() {
  group('VerificationConfirmButtonSection', () {
    late MockVerificationBloc mockBloc;

    setUp(() {
      mockBloc = MockVerificationBloc();
    });

    testWidgets('displays disabled button when input is less than 6 characters',
        (WidgetTester tester) async {
      whenListen(mockBloc,
          Stream.fromIterable([const VerificationState(code: '12345')]),
          initialState:
              const VerificationState(code: '12345')); // Simulate code input

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<VerificationBloc>.value(
              value: mockBloc,
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
      whenListen(mockBloc,
          Stream.fromIterable([const VerificationState(code: '123456')]),
          initialState:
              const VerificationState(code: '123456')); // Simulate code input

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<VerificationBloc>.value(
              value: mockBloc,
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
  });
}
