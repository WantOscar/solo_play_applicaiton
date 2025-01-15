import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

void main() {
  late final MaterialApp widget;
  group("Hexagon Grid Widget Test", () {
    setUpAll(() {
      widget = const MaterialApp(home: HexagonGrid(offsets: []));
    });
    testWidgets("description", (widget) {});
  });
}
