import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

void main() {
  late HexagonGrid widget;
  group("Hexagon Grid Unit Test", () {
    group("Hexagon Grid의 기본값 중", () {
      setUpAll(() {
        widget = const HexagonGrid(offsets: []);
      });

      test("radius는 71.5이다.", () {
        expect(widget.radius, 71.5);
      });

      test("borderRadius는 10.0이다.", () {
        expect(widget.borderRadius, 10.0);
      });

      test("space는 0.0이다.", () {
        expect(widget.space, 0.0);
      });

      test("distance는 30.0이다.", () {
        expect(widget.distance, 30.0);
      });
    });

    group("Hexagon Grid 기본 속성 중", () {
      setUpAll(() {
        widget = const HexagonGrid(
          offsets: [],
          radius: 30.0,
          borderRadius: 15.0,
          space: 2.0,
          distance: 15.0,
        );
      });
      test("radius는 사용자의 입력값과 동일하게 변경된다.", () {
        expect(widget.radius, 30.0);
      });

      test("borderRadius는 사용자의 입력값과 동일하게 변경된다.", () {
        expect(widget.borderRadius, 15.0);
      });

      test("space는 사용자의 입력값과 동일하게 변경된다.", () {
        expect(widget.space, 2.0);
      });

      test("distance는 사용자의 입력값과 동일하게 변경된다.", () {
        expect(widget.distance, 15.0);
      });
    });

    group("Hexagon Grid의 getCanvasOffset 메소드는", () {
      test("[0, 1], [1, 0]이 주어진 경우 [1, 1]이 반환된다.", () {
        final offsets = [
          const HexagonPosition(x: 0, y: 1),
          const HexagonPosition(x: 1, y: 0),
        ];
        widget = HexagonGrid(offsets: offsets);

        final result = widget.getCanvasOffset();

        expect(result.dx, 1);
        expect(result.dy, 1);
      });

      test("[3, 1], [10, 0]이 주어진 경우 [10, 1]이 반환된다.", () {
        final offsets = [
          const HexagonPosition(x: 3, y: 1),
          const HexagonPosition(x: 10, y: 0),
        ];

        widget = HexagonGrid(offsets: offsets);

        final result = widget.getCanvasOffset();

        expect(result.dx, 10);
        expect(result.dy, 1);
      });
    });
  });
}
