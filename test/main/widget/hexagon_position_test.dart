import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:solo_play_application/src/course/presentation/widget/hexagon_grid.dart';

void main() {
  group('Hexagon Position Unit Test', () {
    test('생성자가 올바르게 프로퍼티를 할당한다.', () {
      const position = HexagonPosition(
          x: 10, y: 20, color: Colors.blue, type: HexagonSectionType.bottom);

      expect(position.x, 10);
      expect(position.y, 20);
      expect(position.color, Colors.blue);
      expect(position.type, HexagonSectionType.bottom);
    });

    test('copy 메소드가 잘 동작한다.', () {
      const position = HexagonPosition(
          x: 10, y: 20, color: Colors.blue, type: HexagonSectionType.bottom);

      final newPosition = position.copy(x: 15, color: Colors.red);

      expect(newPosition.x, 15);
      expect(newPosition.y, 20); // unchanged
      expect(newPosition.color, Colors.red);
      expect(newPosition.type, HexagonSectionType.bottom); // unchanged
    });

    test('center 메소드를 통해서 중심점을 올바르게 지정한다.', () {
      const position =
          HexagonPosition(x: 1, y: 2, type: HexagonSectionType.top);

      const radius = 50.0;
      const distance = 30.0;
      final center = position.center(1, 2, radius, distance);

      // 수동으로 계산한 값과 비교
      const expectedX = 3 * 1 / 2 * radius + radius; // thOffset.dx = radius
      final expectedY = sqrt(3.0) * radius * 2 -
          (sqrt(3.0) * radius / 2) * (1 % 2) +
          sqrt(3.0) * radius;

      expect(center.dx, closeTo(expectedX, 0.01));
      expect(center.dy, closeTo(expectedY, 0.01));
    });

    test('getHexagonPath를 통해서 육각형 모양의 Path를 올바르게 반환한다.', () {
      const position = HexagonPosition(x: 1, y: 2);
      const radius = 50.0;
      const space = 5.0;
      const center = Offset(100, 100);
      const borderRadius = 10.0;

      final path = position.getHexagonPath(
        radius: radius,
        space: space,
        center: center,
        borderRadius: borderRadius,
      );

      // Path 시작점이 올바른지 확인
      final startPoint = Offset(radius - space + center.dx, center.dy);
      final metrics = path.computeMetrics().toList();

      expect(metrics.isNotEmpty, true);
      expect(metrics.first.length, greaterThan(0)); // Path 길이가 있어야 함

      // Path가 폐쇄형인지 확인
      expect(path.contains(startPoint), true);
    });
  });
}
