import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/verification/views/verification_intro_ui.dart';

void main() {
  group(VerificationIntroUI, () {
    late Widget widget;

    setUp(() {
      widget = MaterialApp(home: VerificationIntroUI());
    });

    testWidgets('should render correctly', (tester) async {
      await tester.pumpWidget(widget);

      expect(find.byType(VerificationIntroUI),
          matchesGoldenFile("goldens/verification-intro-ui-default.png"));
    });
  });
}
