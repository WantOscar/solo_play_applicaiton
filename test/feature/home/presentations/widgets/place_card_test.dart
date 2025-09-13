import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_badge_widget.dart';
import 'package:solo_play_application/src/features/home/presentation/widgets/place_card.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

void main() {
  group(PlaceCard, () {
    late Widget widget;
    setUp(() {
      widget = MaterialApp(
        home: Scaffold(body: Center(child: PlaceCard())),
      );
    });
    testWidgets("should render place card correctly", (tester) async {
      await tester.pumpWidget(widget);

      final cardFinder = find.byKey(Key('place_thumbnail_container'));
      expect(cardFinder, findsOneWidget);

      /// card 섬네일 부분의 높이 고정값 131이 맞는지 검증
      final card = tester.widget<Container>(cardFinder);
      final cardSize = tester.getSize(cardFinder);
      expect(cardSize.height, 131);

      /// container의 border 위쪽 양옆 border가 10인지 검증
      expect(
        (card.decoration as BoxDecoration).borderRadius,
        BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      );

      /// card의 title, content, label text style 검증
      /// title의 text 및 style 검증
      final titleFinder = find.text('도심 속 조용한 로스터리 카페');
      expect(titleFinder, findsOneWidget);
      final titleText = tester.widget<Text>(titleFinder);
      final titleStyle = titleText.style!;
      expect(titleStyle.fontSize, 14);
      expect(titleStyle.fontWeight, FontWeight.w700);
      expect(titleStyle.fontStyle, FontStyle.normal);

      /// content의 text 및 style 검증
      final contentFinder = find.text('머큐리에스프레소바');
      expect(contentFinder, findsOneWidget);
      final contentText = tester.widget<Text>(contentFinder);
      final contetnStyle = contentText.style!;
      expect(contetnStyle.fontSize, 12);
      expect(contetnStyle.fontWeight, FontWeight.w400);
      expect(contetnStyle.fontStyle, FontStyle.normal);

      /// primary badge widget의 존재 검증
      final primaryBadgeWidgetFinder = find.byType(PrimaryBadgeWidget);
      expect(primaryBadgeWidgetFinder, findsOneWidget);

      /// tag widget 존재 검증
      final tagWidgetFinder = find.byType(PrimaryTagWidget);
      expect(tagWidgetFinder, findsWidgets);
    });
  });
}
