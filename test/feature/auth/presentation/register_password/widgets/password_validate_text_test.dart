import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/widgets/password_validate_text.dart';

void main() {
  group(PasswordValidateText, () {
    testWidgets('should render validation text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidateText(),
          ),
        ),
      );

      expect(find.text('✓ 8-20자 이내 ✓ 대소문자,숫자,특수문자 포함'), findsOneWidget);
    });

    testWidgets('should have correct text style', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidateText(),
          ),
        ),
      );

      final textWidget =
          tester.widget<Text>(find.text('✓ 8-20자 이내 ✓ 대소문자,숫자,특수문자 포함'));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.color, const Color(0xff8e8e8e));
    });

    testWidgets('should have correct success text style',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PasswordValidateText(
              isValid: true,
            ),
          ),
        ),
      );

      final textWidget =
          tester.widget<Text>(find.text('✓ 8-20자 이내 ✓ 대소문자,숫자,특수문자 포함'));
      expect(textWidget.style?.fontSize, 14);
      expect(textWidget.style?.color, const Color(0xff266FF7));
    });
  });
}
