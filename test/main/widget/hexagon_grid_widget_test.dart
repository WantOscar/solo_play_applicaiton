import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

void main() {
  late MaterialApp widget;
  group("Hexagon Grid의 offset가", () {
    testWidgets("[0, 1], [1, 0]을 가지는 경우 올바르게 계산된다.", (tester) async {
      final offsets = [
        const HexagonPosition(x: 0, y: 1),
        const HexagonPosition(x: 1, y: 0),
      ];
      widget = MaterialApp(
          home: Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(child: HexagonGrid(offsets: offsets))),
      ));
      final Offset expectSize = _calcateSize(1, 1);
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize = Size(expectSize.dx + 10, expectSize.dy + 10);
      await tester.pumpWidget(widget);
      final size = tester.getSize(find.byType(HexagonGrid));
      expect(size.width, expectSize.dx);
      expect(size.height, expectSize.dy);
    });

    testWidgets("[3, 1], [10, 0]를 가지는 경우 올바르게 계산된다.", (tester) async {
      final offsets = [
        const HexagonPosition(x: 3, y: 1),
        const HexagonPosition(x: 10, y: 0),
      ];
      widget = MaterialApp(
          home: Scaffold(
        body: HexagonGrid(offsets: offsets),
      ));
      final Offset expectSize = _calcateSize(10, 1);
      tester.view.devicePixelRatio = 1.0;
      tester.view.physicalSize = Size(expectSize.dx + 10, expectSize.dy + 10);
      await tester.pumpWidget(widget);
      final size = tester.getSize(find.byType(HexagonGrid));
      expect(size.width, expectSize.dx);
      expect(size.height, expectSize.dy);
    });
  });
}

Offset _calcateSize(int x, int y, [double? radius, double? distance]) {
  final r = (radius ?? 71.5);
  final d = (distance ?? 30);
  final dx = (3 * x + 4) / 2 * r;
  final dy = (2 * y + 3) / 2 * r * sqrt(3.0) + d;
  return Offset(dx, dy);
}
