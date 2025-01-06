import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/main/view/main_view.dart';
import 'package:solo_play_application/src/main/view/recommend_view.dart';

void main() {
  late Widget widget;
  group("Main View UI 테스트", () {
    setUp(() {
      widget = const MaterialApp(
        home: MainView(),
      );
    });
    testWidgets("Main View에서 추천 영역이 잘 랜더링 된다.", (tester) async {
      await tester.pumpWidget(widget);
      expect(find.byType(RecommendView), findsOneWidget);
    });
  });
}
