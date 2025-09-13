import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/core/widgets/primary_text_field.dart';

void main() {
  group(PrimaryTextField, () {
    testWidgets('should render focus border correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(child: PrimaryTextField()),
        ),
      );

      await tester.pumpWidget(widget);

      // TextField 찾기
      final textFieldFinder = find.byType(PrimaryTextField);
      expect(textFieldFinder, findsOneWidget);

      // 포커스 주기
      await tester.tap(textFieldFinder);
      await tester.pumpAndSettle();

      final textField = tester.widget<TextField>(textFieldFinder);
      final decoration = textField.decoration!;

      expect(decoration.focusedBorder, isA<OutlineInputBorder>());
      final border = decoration.focusedBorder as OutlineInputBorder;
      expect(border.borderSide.color, const Color(0xff000000));
      expect(border.borderSide.width, 1.0);
    });

    testWidgets('should render enable border correctly', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: PrimaryTextField(isError: false),
        ),
      );

      await tester.pumpWidget(widget);

      final textFieldFinder = find.byType(PrimaryTextField);
      final textField = tester.widget<TextField>(textFieldFinder);
      final decoration = textField.decoration!;

      expect(decoration.enabledBorder, isA<OutlineInputBorder>());
      final border = decoration.enabledBorder as OutlineInputBorder;
      expect(border.borderSide.color, const Color(0xffcacaca));
      expect(border.borderSide.width, 1.0);
    });

    testWidgets('should render error border when isError is true',
        (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: PrimaryTextField(isError: true),
        ),
      );

      await tester.pumpWidget(widget);

      final textFieldFinder = find.byType(PrimaryTextField);
      final textField = tester.widget<TextField>(textFieldFinder);
      final decoration = textField.decoration!;

      expect(decoration.enabledBorder, isA<OutlineInputBorder>());
      final border = decoration.enabledBorder as OutlineInputBorder;
      expect(border.borderSide.color, const Color(0xffff0000));
      expect(border.borderSide.width, 1.0);
    });

    testWidgets('should render hint label correctly', (tester) async {
      const hint = 'Enter text';
      final widget = MaterialApp(
        home: Scaffold(
          body: PrimaryTextField(hintText: hint),
        ),
      );

      await tester.pumpWidget(widget);

      final hintFinder = find.text(hint);
      expect(hintFinder, findsOneWidget);
    });

    testWidgets('should render correctly when isError true', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTextField(
              isError: true,
            ),
          ),
        ),
      );

      await tester.pumpWidget(widget);
      expect(find.byType(PrimaryTextField),
          matchesGoldenFile('goldens/primary-text-field-error.png'));
    });

    testWidgets('should render correctly when isError false', (tester) async {
      final widget = MaterialApp(
        home: Scaffold(
          body: Center(
            child: PrimaryTextField(
              isError: false,
            ),
          ),
        ),
      );
      await tester.pumpWidget(widget);

      expect(find.byType(PrimaryTextField),
          matchesGoldenFile('goldens/primary-text-field-default.png'));
    });
  });
}
