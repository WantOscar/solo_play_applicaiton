import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_button.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/sections/verification_intro_button_section.dart';

void main() {
  group(VerificationIntroButtonSection, () {
    late Widget widget;

    setUp(() {
      widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: VerificationIntroButtonSection(),
          ),
        ),
      );
    });

    testWidgets('should render activeChild correctly', (tester) async {
      await tester.pumpWidget(widget);

      final activeChild =
          tester.widget<PrimaryButton>(find.byType(PrimaryButton)).activeChild;

      expect(activeChild, isA<Text>());

      final labelFinder = find.text("본인인증 하러 가기");

      final activeLabel = tester.widget<Text>(labelFinder);

      expect(activeLabel.style?.color, Color(0xffffffff));
      expect(activeLabel.style?.fontSize, 16);
      expect(activeLabel.style?.fontWeight, FontWeight.w700);
    });

    testWidgets('should render button correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(VerificationIntroButtonSection),
          matchesGoldenFile('goldens/verification-intro-button-default.png'));
    });
  });
}
