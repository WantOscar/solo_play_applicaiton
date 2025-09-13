import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_header.dart'; // Updated widget name

void main() {
  group(RegisterCompleteHeader, () {
    testWidgets('should render correct text and styles',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RegisterCompleteHeader(),
          ),
        ),
      );

      // Find the RegisterCompleteHeader widget
      final headerFinder = find.byType(RegisterCompleteHeader);
      expect(headerFinder, findsOneWidget);

      // Check the children of the Column within RegisterCompleteHeader
      final Column column = tester.widget(
          find.descendant(of: headerFinder, matching: find.byType(Column)));
      expect(column.children.length, 3); // RichText, SizedBox, Text
      expect(
          column.crossAxisAlignment, CrossAxisAlignment.start); // New assertion

      // Assert the first RichText
      final RichText richText = column.children[0] as RichText;
      final TextSpan textSpan = richText.text as TextSpan;

      expect(textSpan.children!.length, 2);

      final TextSpan emailAuthSpan = textSpan.children![0] as TextSpan;
      expect(emailAuthSpan.text, '이메일 인증이');
      expect(emailAuthSpan.style!.color, const Color(0xff0070F0));
      expect(emailAuthSpan.style!.fontSize, 26);
      expect(emailAuthSpan.style!.fontWeight, FontWeight.w700);

      final TextSpan completedSpan = textSpan.children![1] as TextSpan;
      expect(completedSpan.text, ' 완료되었습니다.');
      expect(completedSpan.style!.color, const Color(0xff000000));
      expect(completedSpan.style!.fontSize, 26);
      expect(completedSpan.style!.fontWeight, FontWeight.w700);

      // Assert the SizedBox
      final SizedBox sizedBox = column.children[1] as SizedBox;
      expect(sizedBox.height, 6);

      // Assert the second Text widget
      final Text newTextWidget = column.children[2] as Text;
      expect(newTextWidget.data, '이제 솔플과 함께 당신만의 코스를 찾으러 가볼까요?');
      expect(newTextWidget.style!.fontSize, 16);
      expect(newTextWidget.style!.fontWeight, FontWeight.w400);
      expect(newTextWidget.style!.color, const Color(0xff666666));

      // Golden test
      await expectLater(
        find.byType(RegisterCompleteHeader),
        matchesGoldenFile('goldens/register_complete_header.png'),
      );
    });
  });
}
