import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_header.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/sections/register_complete_button_section.dart';
import 'package:solo_play_application/src/features/auth/presentation/register_complete/views/register_complete_ui.dart';

void main() {
  group(RegisterCompleteUi, () {
    testWidgets(
        'should render header and button with correct layout and padding',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RegisterCompleteUi(),
          ),
        ),
      );

      // Find the RegisterUi widget
      final registerUiFinder = find.byType(RegisterCompleteUi);
      expect(registerUiFinder, findsOneWidget);

      // Check for Padding with specific values
      final paddingFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Padding &&
            widget.padding ==
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 62.0),
      );
      expect(paddingFinder, findsOneWidget);

      // Check for Column with specific mainAxisAlignment and crossAxisAlignment
      final columnFinder = find.byWidgetPredicate(
        (widget) =>
            widget is Column &&
            widget.mainAxisAlignment == MainAxisAlignment.spaceBetween &&
            widget.crossAxisAlignment == CrossAxisAlignment.start,
        skipOffstage: false,
      );
      expect(columnFinder, findsOneWidget);
      final column = tester.widget<Column>(columnFinder);
      expect(column.children.length, 2); // Header and Button

      // Check for RegisterCompleteHeader
      expect(find.byType(RegisterCompleteHeader), findsOneWidget);

      // Check for RegisterCompleteButtonSection
      expect(find.byType(RegisterCompleteButtonSection), findsOneWidget);

      // Golden test
      await expectLater(
        find.byType(RegisterCompleteUi),
        matchesGoldenFile('goldens/register-complete-ui-default.png'),
      );
    });
  });
}
