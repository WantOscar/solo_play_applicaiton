import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/home/presentation/widgets/place_card_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

void main() {
  group('PlaceCardWidget', () {
    /// 타이틀, 콘텐트, 뱃지 텍스트, 태그의 정상적인 렌더링 확인
    testWidgets('renders title, content, badgeText, and tags correctly',
        (tester) async {
      // Arrange
      const title = '도심 속 조용한 로스터리 카페';
      const content = '머큐리에스프레소바';
      const badgeText = '용산구';
      const tags = ['#커피향 가득', '#스웨덴커피'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: title,
              content: content,
              badgeText: badgeText,
              tags: tags,
              thumNail: Icon(Icons.coffee),
            ),
          ),
        ),
      );

      expect(find.text(title), findsOneWidget);
      expect(find.text(content), findsOneWidget);
      expect(find.text(badgeText), findsOneWidget);

      /// 모든 태그가 표시되는지 확인
      for (final tag in tags) {
        expect(find.text(tag), findsOneWidget);
      }

      /// thumNail 확인
      expect(find.byIcon(Icons.coffee), findsOneWidget);
    });

    /// 태그가 null일 때 안전하게 아무 태그도 표시되지 않는지 확인
    testWidgets('handles null tags safely (renders no tags)', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: '테스트 카페',
              content: '테스트 설명',
              badgeText: '강남구',
              tags: null,
              thumNail: Icon(Icons.coffee),
            ),
          ),
        ),
      );

      /// 기본 텍스트는 정상 출력
      expect(find.text('테스트 카페'), findsOneWidget);
      expect(find.text('테스트 설명'), findsOneWidget);
      expect(find.text('강남구'), findsOneWidget);

      /// 태그가 null → 태그 없음
      expect(find.byType(PrimaryTagWidget), findsNothing);
    });

    /// 태그가 빈 리스트일 때 ui가 안전한지 확인
    testWidgets('handles empty tags list safely (renders no tags)',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: '카페 제목',
              content: '카페 설명',
              badgeText: '서초구',
              tags: [], // 빈 리스트
              thumNail: Icon(Icons.coffee),
            ),
          ),
        ),
      );

      /// 태그가 없는 경우
      expect(find.text('카페 제목'), findsOneWidget);
      expect(find.text('카페 설명'), findsOneWidget);
      expect(find.text('서초구'), findsOneWidget);
      expect(find.byType(PrimaryTagWidget), findsNothing);
    });

    /// 골든 테스트
    testWidgets('PlaceCardWidget golden test', (tester) async {
      const title = '도심 속 조용한 로스터리 카페';
      const content = '머큐리에스프레소바';
      const badgeText = '용산구';
      const tags = ['#커피향 가득', '#스웨덴커피'];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PlaceCardWidget(
                title: title,
                content: content,
                badgeText: badgeText,
                tags: tags,
                thumNail: Icon(Icons.coffee),
              ),
            ),
          ),
        ),
      );

      await expectLater(
        find.byType(PlaceCardWidget),
        matchesGoldenFile('goldens/place_card_widget.png'),
      );
    });
  });
}
