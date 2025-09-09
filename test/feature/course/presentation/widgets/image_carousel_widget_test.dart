import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/course/widgets/image_carousel_widget.dart';

void main() {
  group('ImageCarouselWidget golden', () {
    const images = [
      AssetImage(
          '/Users/nojeong-un/Downloads/solo_play_applicaiton/test/fixtures/carousel/1.png'),
      AssetImage(
          '/Users/nojeong-un/Downloads/solo_play_applicaiton/test/fixtures/carousel/2.png'),
      AssetImage(
          '/Users/nojeong-un/Downloads/solo_play_applicaiton/test/fixtures/carousel/3.png'),
    ];

    testWidgets('default first page', (tester) async {
      await tester.binding.setSurfaceSize(const Size(375, 560));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final widget = MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFF7F7F7),
          body: Center(
            child: ImageCarouselWidget(
              images: images,
              height: 520,
              borderRadius: 18,
              autoPlay: false,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/image_carousel_widget_default.png'),
      );
    });

    testWidgets('after swipe to second page', (tester) async {
      await tester.binding.setSurfaceSize(const Size(375, 560));
      addTearDown(() => tester.binding.setSurfaceSize(null));

      final widget = MaterialApp(
        home: Scaffold(
          backgroundColor: const Color(0xFFF7F7F7),
          body: Center(
            child: ImageCarouselWidget(
              images: images,
              height: 520,
              borderRadius: 18,
              autoPlay: false,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      await tester.drag(find.byType(PageView), const Offset(-350, 0));
      await tester.pumpAndSettle();

      await expectLater(
        find.byType(Scaffold),
        matchesGoldenFile('goldens/image_carousel_widget_page2.png'),
      );
    });
  });
}
