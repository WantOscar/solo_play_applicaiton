import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';

void main() {
  group('PrimaryBadgeWidget', () {
    const testText = "용산구";
    const horizontal = 8.0;
    const vertical = 3.0;
    const fontSize = 14.0;

    testWidgets(
        'renders text with correct font size and padding when fontSize is provided',
        (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryBadgeWidget(
              text: testText,
              horizontal: horizontal,
              vertical: vertical,
              fontSize: fontSize,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);

      // Text 내용 및 fontSize 검증
      final textFinder = find.text(testText);
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style!.fontSize, fontSize);

      // Padding 검증
      final paddingWidget = tester.widget<Padding>(
        find.ancestor(of: textFinder, matching: find.byType(Padding)).first,
      );
      final padding = paddingWidget.padding as EdgeInsets;
      expect(padding.left, horizontal);
      expect(padding.right, horizontal);
      expect(padding.top, vertical);
      expect(padding.bottom, vertical);
    });

    testWidgets('uses default fontSize 12.0 when fontSize is not provided',
        (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: const PrimaryBadgeWidget(
              text: testText,
              horizontal: horizontal,
              vertical: vertical,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final textWidget = tester.widget<Text>(find.text(testText));
      expect(textWidget.style!.fontSize, 12.0); // 기본값 검증
    });

    testWidgets('matches golden file', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: const PrimaryBadgeWidget(
              text: testText,
              horizontal: horizontal,
              vertical: vertical,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      expect(find.byType(PrimaryBadgeWidget),
          matchesGoldenFile("goldens/primary-badge-widget-default.png"));
    });
  });
}
