import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

void main() {
  group('PrimaryTagWidget', () {
    const testText = '#커피향 가득';

    testWidgets('renders text correctly with default style', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTagWidget(text: testText),
          ),
        ),
      ));

      final textFinder = find.text(testText);
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      final style = textWidget.style!;
      expect(style.fontSize, 12);
      expect(style.fontStyle, FontStyle.normal);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xff8E8E8E));
    });

    testWidgets('renders container with correct decoration and padding',
        (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTagWidget(text: 'Tag'),
          ),
        ),
      ));

      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);

      // BoxDecoration 확인
      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(14));
      expect(decoration.color, const Color(0xffEEEEEE));

      // Padding 확인
      final paddingWidget = containerWidget.child as Padding;
      expect(paddingWidget.padding,
          const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0));
    });

    testWidgets('renders empty text when no text is provided', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTagWidget(),
          ),
        ),
      ));

      final textFinder = find.text('');
      expect(textFinder, findsOneWidget);
    });

    testWidgets('matches golden file', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTagWidget(text: testText),
          ),
        ),
      ));

      expect(find.byType(PrimaryTagWidget),
          matchesGoldenFile("goldens/primary-tag-widget-default.png"));
    });
  });
}
