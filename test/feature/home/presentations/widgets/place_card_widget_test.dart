import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/home/presentation/widgets/place_card_widget.dart';
import 'package:solo_play_application/src/features/rank/presentation/widget/primary_tag_widget.dart';

void main() {
  group('PlaceCardWidget', () {
    const title = '도심 속 조용한 로스터리 카페';
    const content = '머큐리에스프레소바';
    const badgeText = '용산구';
    const tags = ['#커피향 가득', '#스웨덴커피'];
    const tagCount = '+5';

    /// 타이틀, 콘텐트, 뱃지 텍스트, 태그, 태그 개수의 정상적인 렌더링 확인
    testWidgets(
        'renders title, content, badgeText, tags and tagCount correctly',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: title,
              content: content,
              badgeText: badgeText,
              tags: tags,
              tagCount: tagCount,
              thumNail: const Icon(Icons.coffee),
            ),
          ),
        ),
      );

      /// 기본 텍스트 확인
      expect(find.text(title), findsOneWidget);
      expect(find.text(content), findsOneWidget);
      expect(find.text(badgeText), findsOneWidget);

      /// 태그 확인
      for (final tag in tags) {
        expect(find.text(tag), findsOneWidget);
      }

      /// 태그 개수 확인
      expect(find.text(tagCount), findsOneWidget);

      /// 썸네일 확인
      expect(find.byIcon(Icons.coffee), findsOneWidget);
    });

    /// 태그가 null일 때 안전하게 아무 태그도 표시되지 않는지 확인
    testWidgets('handles null tags safely (renders no tags, no tagCount)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
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

      expect(find.text('테스트 카페'), findsOneWidget);
      expect(find.text('테스트 설명'), findsOneWidget);
      expect(find.text('강남구'), findsOneWidget);

      /// 태그와 tagCount가 없어야 함
      expect(find.byType(PrimaryTagWidget), findsNothing);
      expect(find.text('+5'), findsNothing);
    });

    /// 태그가 빈 리스트일 때 ui가 안전한지 확인
    testWidgets('handles empty tags list safely (renders no tags, no tagCount)',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: '카페 제목',
              content: '카페 설명',
              badgeText: '서초구',
              tags: [],
              thumNail: Icon(Icons.coffee),
            ),
          ),
        ),
      );

      expect(find.text('카페 제목'), findsOneWidget);
      expect(find.text('카페 설명'), findsOneWidget);
      expect(find.text('서초구'), findsOneWidget);

      /// 태그 없음
      expect(find.byType(PrimaryTagWidget), findsNothing);
      expect(find.text('+5'), findsNothing);
    });

    /// 오른쪽 Gradient Overlay가 존재하는지 확인
    testWidgets('renders gradient fade overlay on tag list', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlaceCardWidget(
              title: title,
              content: content,
              badgeText: badgeText,
              tags: tags,
              tagCount: tagCount,
              thumNail: Icon(Icons.coffee),
            ),
          ),
        ),
      );

      // Key를 이용해 gradient overlay만 정확히 검증
      expect(find.byKey(const Key('gradient_overlay')), findsOneWidget);
    });

    /// 골든 테스트
    testWidgets('PlaceCardWidget golden test', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: PlaceCardWidget(
                title: title,
                content: content,
                badgeText: badgeText,
                tags: tags,
                tagCount: tagCount,
                thumNail: Icon(Icons.coffee),
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(PlaceCardWidget),
        matchesGoldenFile('goldens/place_card_widget.png'),
      );
    });
  });
}
