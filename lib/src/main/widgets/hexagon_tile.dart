import 'dart:math';
import 'package:flutter/material.dart';

class HexagonTile extends StatelessWidget {
  final Color? color;
  final double width;
  final double? borderRadius;
  const HexagonTile(
      {super.key, this.color, this.width = 143, this.borderRadius = 10});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, width),
      painter: HexagonPainter(width: width, borderRadius: borderRadius!),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final double width;
  final double borderRadius;
  const HexagonPainter({
    required this.width,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = width / 2;
    final center = Offset(width / 2, width / 2);
    const angle = (pi * 2) / 6;
    Paint paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    final path = Path();
    final firstOffset =
        Offset(radius * cos(0.0) + center.dx, radius * sin(0.0) + center.dy);
    // 시작점으로 이동
    path.moveTo(firstOffset.dx, firstOffset.dy);
    for (int i = 1; i < 7; i++) {
      // 첫번째 각도와 두번째 각도 계산
      final currAngle = angle * i;
      final currX = radius * cos(currAngle) + center.dx;
      final currY = radius * sin(currAngle) + center.dy;

      final r = borderRadius;
      final d = 2 * sqrt(3.0) * r / 3;
      final dx = d * cos(currAngle + pi) + currX;
      final dy = d * sin(currAngle + pi) + currY;
      final oval = Rect.fromCircle(center: Offset(dx, dy), radius: r);
      path.arcTo(oval, currAngle - pi / 6, pi / 3, false);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
