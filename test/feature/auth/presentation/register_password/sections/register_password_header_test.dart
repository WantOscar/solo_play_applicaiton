import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_password/sections/register_password_header.dart';

void main() {
  group('RegisterPasswordHeader', () {
    testWidgets('should render title text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RegisterPasswordHeader(),
          ),
        ),
      );

      expect(find.text('비밀번호를 입력해주세요'), findsOneWidget);
    });

    testWidgets('should render subtitle text', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RegisterPasswordHeader(),
          ),
        ),
      );

      expect(find.text('안전한 비밀번호를 설정해주세요'), findsOneWidget);
    });

    testWidgets('should have correct text styles', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RegisterPasswordHeader(),
          ),
        ),
      );

      final titleFinder = find.text('비밀번호를 입력해주세요');
      final titleWidget = tester.widget<Text>(titleFinder);
      expect(titleWidget.style?.fontSize, 24);
      expect(titleWidget.style?.fontWeight, FontWeight.w700);

      final subtitleFinder = find.text('안전한 비밀번호를 설정해주세요');
      final subtitleWidget = tester.widget<Text>(subtitleFinder);
      expect(subtitleWidget.style?.fontSize, 16);
      expect(subtitleWidget.style?.color, const Color(0xff8e8e8e));
    });
  });
}
