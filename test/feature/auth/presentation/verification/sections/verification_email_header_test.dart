import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_email_header.dart'; // This file doesn't exist yet

void main() {
  group('VerificationEmailHeader', () {
    testWidgets('displays correct text and styles', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VerificationEmailHeader(),
          ),
        ),
      );

      final richTextFinder = find.byType(RichText);
      expect(richTextFinder, findsOneWidget);

      final RichText richText = tester.widget(richTextFinder);
      final TextSpan textSpan = richText.text as TextSpan;

      expect(textSpan.children!.length, 2);

      final TextSpan emailSpan = textSpan.children![0] as TextSpan;
      expect(emailSpan.text, '이메일');
      expect(emailSpan.style!.color, const Color(0xff0070F0));
      expect(emailSpan.style!.fontSize, 26);
      expect(emailSpan.style!.fontWeight, FontWeight.w700);

      final TextSpan restOfTextSpan = textSpan.children![1] as TextSpan;
      expect(restOfTextSpan.text, ' 인증하기');
      expect(restOfTextSpan.style!.color, const Color(0xff000000));
      expect(restOfTextSpan.style!.fontSize, 26);
      expect(restOfTextSpan.style!.fontWeight, FontWeight.w700);

      // Golden test
      await expectLater(
        find.byType(VerificationEmailHeader),
        matchesGoldenFile('goldens/verification_email_header.png'),
      );
    });
  });
}