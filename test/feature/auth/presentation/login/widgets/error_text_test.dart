import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/login/widgets/error_text.dart';

void main() {
  group(ErrorText, () {
    testWidgets('should render correctly when errorMessage is Empty',
        (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: ErrorText(),
          ),
        ),
      );

      await tester.pumpWidget(widget);

      expect(find.byType(ErrorText),
          matchesGoldenFile('goldens/error-text-default.png'));
    });

    testWidgets('should render correctly when errorMessage is Empty',
        (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: ErrorText(
              errorMessage: 'error',
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);

      final textFinder = find.text('error');
      expect(textFinder, findsOneWidget);
      final errorText = tester.widget<Text>(textFinder);
      expect(errorText.style?.color, Color(0xffff0000));
      expect(errorText.style?.fontSize, 12);
      expect(errorText.style?.fontWeight, FontWeight.w400);

      expect(find.byType(ErrorText),
          matchesGoldenFile('goldens/error-text-error.png'));
    });
  });
}
