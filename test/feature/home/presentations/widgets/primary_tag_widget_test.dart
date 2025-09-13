import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

void main() {
  group(PrimaryTagWidget, () {
    /// property로 받아온 텍스트가 잘 전달 되는지, style에서 텍스트의 사이즈=12, 스타일=normal, 두께=w400, 컬러=Color(0xff000000)가 잘 적용되어 있는지 검증
    testWidgets('should render text correctly with default style',
        (tester) async {
      late String testText = '#커피향 가득';
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
      expect(style.color, const Color(0xff000000));
    });

    /// 텍스르를 감싸는 컨테이너 확인, 컨테이너의 boxDecoration및 패딩에 대한 검증
    testWidgets('should render container with correct decoration and padding',
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
      expect(containerWidget.child, isA<Padding>());

      final decoration = containerWidget.decoration as BoxDecoration;
      expect(decoration.borderRadius, BorderRadius.circular(14));
      expect(decoration.color, const Color.fromRGBO(0, 0, 0, 0.05));

      final border = decoration.border as Border;
      expect(border.top.width, 0.5);
      expect(border.top.style, BorderStyle.solid);
      expect(border.top.color, const Color.fromRGBO(0, 0, 0, 0.10));

      final paddingWidget = containerWidget.child as Padding;
      expect(paddingWidget.padding,
          const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0));
    });

    /// property 텍스트에 빈 문자열이 들어가도 렌더링 되는지 검증
    testWidgets('should render empty text when no text is provided',
        (tester) async {
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
      const testText = '#커피향 가득';
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
