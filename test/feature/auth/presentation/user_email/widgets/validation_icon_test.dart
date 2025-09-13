import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/user_email/widgets/validation_icon.dart';

void main() {
  group(ValidationIcon, () {
    group('given isValid is true', () {
      late Widget widget;

      setUp(() {
        widget = MaterialApp(
          home: Scaffold(
            body: Center(
              child: ValidationIcon(
                isValid: true,
              ),
            ),
          ),
        );
      });
      testWidgets('should render background container correctly',
          (tester) async {
        await tester.pumpWidget(widget);
        final backgroundFinder = find.byType(Container);
        expect(backgroundFinder, findsOneWidget);

        final backgroundsize = tester.getSize(backgroundFinder);
        expect(backgroundsize.width, 19.0);
        expect(backgroundsize.height, 19.0);

        final background = tester.widget<Container>(backgroundFinder);
        final decoration = background.decoration as BoxDecoration;
        expect(
          decoration.color,
          Color(0xff008C15),
        );
        expect(decoration.shape, BoxShape.circle);
      });
      testWidgets('should render icon correctly', (tester) async {
        await tester.pumpWidget(widget);

        final iconFinder = find.byIcon(Icons.check_rounded);

        expect(iconFinder, findsOneWidget);
      });

      testWidgets('should render correctly', (tester) async {
        await tester.pumpWidget(widget);

        expectLater(find.byType(ValidationIcon),
            matchesGoldenFile('goldens/validation-icon-default.png'));
      });
    });

    group('given isValid is false', () {
      late Widget widget;
      setUp(() {
        widget = MaterialApp(
          home: Scaffold(
            body: Center(
              child: ValidationIcon(
                isValid: false,
              ),
            ),
          ),
        );
      });
      testWidgets('should render background container correctly',
          (tester) async {
        await tester.pumpWidget(widget);
        final backgroundFinder = find.byType(Container);
        expect(backgroundFinder, findsOneWidget);

        final backgroundsize = tester.getSize(backgroundFinder);
        expect(backgroundsize.width, 19.0);
        expect(backgroundsize.height, 19.0);

        final background = tester.widget<Container>(backgroundFinder);
        final decoration = background.decoration as BoxDecoration;
        expect(
          decoration.color,
          Color(0xffff0000),
        );
        expect(decoration.shape, BoxShape.circle);
      });

      testWidgets('should render icon correctly', (tester) async {
        await tester.pumpWidget(widget);

        final iconFinder = find.byIcon(Icons.close_rounded);

        expect(iconFinder, findsOneWidget);
      });

      testWidgets('should render correctly', (tester) async {
        await tester.pumpWidget(widget);

        expectLater(find.byType(ValidationIcon),
            matchesGoldenFile('goldens/validation-icon-invalid.png'));
      });
    });
  });
}
