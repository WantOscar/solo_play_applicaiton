import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/main/view/recommend_view.dart';

void main() {
  late Widget widget;

  group("Recommend Item Widget UI 테스트", () {
    setUp(() {
      widget = const MaterialApp(
        home: RecommendItemWidget(title: "item title"),
      );
    });

    testWidgets("추천 아이템 위젯의 타이틀이 잘 랜더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("recommend item row thum nail")),
          findsOneWidget);
      expect(find.byKey(const Key("recommend item row title")), findsOneWidget);
    });
  });

  group("Recommend View UI 테스트", () {
    setUp(() {
      widget = const MaterialApp(
        home: RecommendView(
          title: "test title",
        ),
      );
    });

    testWidgets("Recommend View에서 header영역과 items 영역이 잘 랜더링 된다.",
        (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byKey(const Key("recommend view header")), findsOneWidget);
      expect(find.byKey(const Key("recommend view items")), findsOneWidget);
    });

    testWidgets("사용자는 title을 지정할 수 있다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.bySemanticsLabel("test title"), findsOneWidget);
    });
  });
}
