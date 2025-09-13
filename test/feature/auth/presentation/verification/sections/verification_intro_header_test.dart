import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_intro_header.dart';

void main() {
  group(VerificationIntroHeader, () {
    late Widget widget;

    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: VerificationIntroHeader(),
          ),
        ),
      );
    });

    testWidgets('should render label = 본인인증을 진행해주세요 correctly', (tester) async {
      await tester.pumpWidget(widget);

      final labelFinder = find.text('본인인증을\n진행해주세요');
      expect(labelFinder, findsOneWidget);

      final label = tester.widget<Text>(labelFinder);
      expect(label.style?.color, Color(0xff000000));
      expect(label.style?.fontSize, 24);
      expect(label.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('should render 본인 인증 후 더 빠르게 서비스를 이용하세요! correctly',
        (tester) async {
      await tester.pumpWidget(widget);

      final labelFinder = find.text('본인 인증 후 더 빠르게 서비스를 이용하세요!');
      expect(labelFinder, findsOneWidget);

      final label = tester.widget<Text>(labelFinder);
      expect(label.style?.color, Color(0xff666666));
      expect(label.style?.fontSize, 16);
      expect(label.style?.fontWeight, FontWeight.w400);
    });

    testWidgets('should render correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(VerificationIntroHeader),
          matchesGoldenFile('goldens/verification-intro-header-default.png'));
    });
  });
}
