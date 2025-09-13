import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/widgets/password_check_validate_text.dart';

void main() {
  group(PasswordCheckValidateText, () {
    testWidgets('should render validation text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordCheckValidateText(),
          ),
        ),
      );

      expect(find.text('✓ 비밀번호가 같습니다'), findsOneWidget);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordCheckValidateText(),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('✓ 비밀번호가 같습니다'));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.color, const Color(0xff8e8e8e));
    });
    testWidgets('should have correct success text style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordCheckValidateText(
              isValid: true,
            ),
          ),
        ),
      );

      final textWidget = tester.widget<Text>(find.text('✓ 비밀번호가 같습니다'));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.color, const Color(0xff266FF7));
    });
  });
}
