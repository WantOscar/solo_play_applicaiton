import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/resend_email_section.dart'; // This file doesn't exist yet

void main() {
  group(ResendEmailSection, () {
    testWidgets(
        'should render PrimaryTextField and PrimaryButton with correct properties',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ResendEmailSection(
              email: 'test@test.com',
            ),
          ),
        ),
      );

      // Find the ResendEmailSection widget
      final sectionFinder = find.byType(ResendEmailSection);
      expect(sectionFinder, findsOneWidget);

      // Check for Row
      final rowFinder =
          find.descendant(of: sectionFinder, matching: find.byType(Row));
      expect(rowFinder, findsOneWidget);

      // Check for PrimaryTextField
      final textFieldFinder = find.byType(PrimaryTextField);
      expect(textFieldFinder, findsOneWidget);
      // We don't assert hintText or initial value yet as it's not specified for this stage.

      // Check for PrimaryButton
      final buttonFinder = find.byType(PrimaryButton);
      expect(buttonFinder, findsOneWidget);

      // Assert the label text of the button
      expect(find.text('재전송'), findsOneWidget);

      // Assert the style of the button's text
      final Text buttonText = tester.widget(
          find.descendant(of: buttonFinder, matching: find.byType(Text)));
      expect(buttonText.style!.color, const Color(0xffffffff));
      expect(buttonText.style!.fontSize, 16);
      expect(buttonText.style!.fontWeight, FontWeight.w700);

      // Golden test
      await expectLater(
        find.byType(ResendEmailSection),
        matchesGoldenFile('goldens/resend_email_section.png'),
      );
    });
  });
}
