import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';

void main() {
  group(PrimaryBadgeWidget, () {
    late Widget widget;
    const testText = "용산구";
    const horizontal = 8.0;
    const vertical = 3.0;

    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
              child: PrimaryBadgeWidget(
            text: testText,
            horizontal: horizontal,
            vertical: vertical,
          )),
        ),
      );
    });

    testWidgets('should render primary badge widget correctly', (tester) async {
      await tester.pumpWidget(widget);

      /// container 내부의 text property의 임의 값 및 textStyle 검증
      final textFinder = find.text(testText);
      expect(textFinder, findsOneWidget);
      final textWidget = tester.widget<Text>(textFinder);
      final style = textWidget.style!;
      expect(style.fontSize, 10);
      expect(style.fontStyle, FontStyle.normal);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xffFFFFFF));

      /// text를 둘러싼 container의 borderRadius와 Color 검증
      final containerFinder = find.ancestor(
        of: textFinder,
        matching: find.byType(Container),
      );
      expect(containerFinder, findsOneWidget);

      final container = tester.widget<Container>(containerFinder);
      final decoration = container.decoration as BoxDecoration;
      expect(
        decoration.borderRadius,
        BorderRadius.circular(10),
      );
      expect(decoration.color, const Color(0xff0070F0));

      /// container 내부의 horizontal, vertical 2가지 property의 임의 값 검증
      final paddingFinder = find.ancestor(
        of: textFinder,
        matching: find.byType(Padding),
      );
      final paddingWidget = tester.widget<Padding>(paddingFinder.first);
      final padding = paddingWidget.padding as EdgeInsets;
      expect(padding.left, horizontal);
      expect(padding.right, horizontal);
      expect(padding.top, vertical);
      expect(padding.bottom, vertical);
    });

    testWidgets('matches golden file', (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(PrimaryBadgeWidget),
          matchesGoldenFile("goldens/primary-badge-widget-default.png"));
    });
  });
}
