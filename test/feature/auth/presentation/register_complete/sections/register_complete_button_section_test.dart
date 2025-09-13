import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart'; // Assuming this path
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_button_section.dart'; // This file doesn't exist yet

void main() {
  group(RegisterCompleteButtonSection, () {
    testWidgets('should render PrimaryButton with correct label and styles',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RegisterCompleteButtonSection(),
          ),
        ),
      );

      // Find the PrimaryButton
      final primaryButtonFinder = find.byType(PrimaryButton);
      expect(primaryButtonFinder, findsOneWidget);

      // Assert the label text
      expect(find.text('시작하기'), findsOneWidget);

      // Assert the style of the button's text
      final Text buttonText = tester.widget(find.descendant(
          of: primaryButtonFinder, matching: find.byType(Text)));
      expect(buttonText.style!.color, const Color(0xffffffff));
      expect(buttonText.style!.fontSize, 16);
      expect(buttonText.style!.fontWeight, FontWeight.w700);

      // Golden test
      await expectLater(
        find.byType(RegisterCompleteButtonSection),
        matchesGoldenFile('goldens/register_complete_button_section.png'),
      );
    });
  });
}
