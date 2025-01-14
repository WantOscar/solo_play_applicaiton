import 'dart:math';
import 'package:flutter/material.dart';

class HexagonGrid extends StatelessWidget {
  final double radius;
  final List<HexagonPosition> offsets;
  final double? borderRadius;
  final double? space;
  final double? distance;
  const HexagonGrid(
      {super.key,
      this.radius = 71.5,
      this.borderRadius = 10,
      this.space = 0.0,
      required this.offsets,
      this.distance = 30});

  Offset getCanvasOffset() {
    var x = 0;
    var y = 0;
    for (HexagonPosition pos in offsets) {
      final nx = pos.x;
      final ny = pos.y;
      x = max(nx, x);
      y = max(ny, y);
    }
    final result = Offset(x.toDouble(), y.toDouble());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final Offset maxOffset = getCanvasOffset();
    final width = (3 * maxOffset.dx + 4) / 2 * radius;
    final height = (2 * maxOffset.dy + 3) / 2 * radius * sqrt(3.0);
    return CustomPaint(
      size: Size(width, height + distance!),
      painter: HexagonPainter(
          radius: radius,
          space: space!,
          borderRadius: borderRadius!,
          positions: offsets,
          distance: distance!),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final double radius;
  final double space;
  final double borderRadius;
  final double distance;
  final List<HexagonPosition> positions;
  const HexagonPainter({
    required this.radius,
    required this.space,
    required this.borderRadius,
    required this.positions,
    required this.distance,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final thOffset = Offset(radius, sqrt(3.0) * radius);
    final Map<HexagonSectionType, double> vector = {
      HexagonSectionType.top: 0,
      HexagonSectionType.bottom: distance,
    };
    for (HexagonPosition postion in positions) {
      final x = postion.x;
      final y = postion.y;
      final center = Offset(
          3 * x / 2 * radius + thOffset.dx,
          (sqrt(3.0) * radius * y) -
              ((sqrt(3.0) * radius / 2) * (x % 2)) +
              thOffset.dy +
              vector[postion.type]!);
      const angle = (pi * 2) / 6;
      Paint paint = Paint()
        ..color = postion.color!
        ..style = PaintingStyle.fill;
      final paddingRadius = radius - space;
      final firstOffset = Offset(paddingRadius * cos(0.0) + center.dx,
          paddingRadius * sin(0.0) + center.dy);
      final path = Path();
      path.moveTo(firstOffset.dx, firstOffset.dy);
      for (int i = 1; i < 7; i++) {
        // 첫번째 각도와 두번째 각도 계산
        final currAngle = angle * i;
        final currX = paddingRadius * cos(currAngle) + center.dx;
        final currY = paddingRadius * sin(currAngle) + center.dy;

        final r = borderRadius;
        final d = 2 * sqrt(3.0) * r / 3;
        final dx = d * cos(currAngle + pi) + currX;
        final dy = d * sin(currAngle + pi) + currY;
        final oval = Rect.fromCircle(center: Offset(dx, dy), radius: r);
        path.arcTo(oval, currAngle - pi / 6, pi / 3, false);
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum HexagonSectionType {
  top,
  bottom,
}

class HexagonPosition {
  final int x;
  final int y;
  final Color? color;
  final HexagonSectionType type;

  const HexagonPosition({
    required this.x,
    required this.y,
    this.type = HexagonSectionType.top,
    this.color = const Color(0xffafafaf),
  });

  HexagonPosition copy({
    int? x,
    int? y,
    Color? color,
    HexagonSectionType? type,
  }) {
    return HexagonPosition(
        x: x ?? this.x,
        y: y ?? this.y,
        color: color ?? this.color,
        type: type ?? this.type);
  }
}
