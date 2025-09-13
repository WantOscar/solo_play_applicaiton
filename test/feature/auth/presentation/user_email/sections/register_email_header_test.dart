import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/sections/sections.dart';

void main() {
  group(RegisterEmailHeader, () {
    late Widget widget;

    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: RegisterEmailHeader(),
          ),
        ),
      );
    });

    testWidgets("should render header top correctly", (tester) async {
      await tester.pumpWidget(widget);

      expect(find.text("로그인에 사용할"), findsOneWidget);

      final firstWidget = tester.widget<Text>(find.text("로그인에 사용할"));
      expect(firstWidget.style?.fontSize, 26);
      expect(firstWidget.style?.fontWeight, FontWeight.w700);
      expect(firstWidget.style?.color, Color(0xff000000));

      // expectLater(find.byType(ResisterEmailHeader),
      //     matchesGoldenFile("goldens/resister-email-header-default.png"));
    });

    testWidgets('should render header bottom correclty ', (tester) async {
      await tester.pumpWidget(widget);

      final richTextFinder = find.byKey(Key("header-bottom"));
      expect(richTextFinder, findsOneWidget);
      final richText = tester.widget<RichText>(richTextFinder);
      final headerBottom = richText.text as TextSpan;
      expect(headerBottom.toPlainText(), "아이디를 입력해주세요.");

      final children = headerBottom.children;

      final highlightText = children?[0] as TextSpan;

      expect(highlightText.style?.fontSize, 26);
      expect(highlightText.style?.fontWeight, FontWeight.w700);
      expect(highlightText.style?.color, Color(0xff266FF7));

      final normalText = children?[1] as TextSpan;

      expect(normalText.style?.fontSize, 26);
      expect(normalText.style?.fontWeight, FontWeight.w700);
      expect(normalText.style?.color, Color(0xff000000));
    });

    testWidgets('should render header correclty', (tester) async {
      await tester.pumpWidget(widget);

      expectLater(find.byType(RegisterEmailHeader),
          matchesGoldenFile('goldens/register-email-header-default.png'));
    });
  });
}
