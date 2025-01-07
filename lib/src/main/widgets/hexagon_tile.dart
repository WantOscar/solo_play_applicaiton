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
    return SizedBox(
      width: width,
      height: width,
      child: CustomPaint(
        painter: HexagonPainter(width: width, borderRadius: borderRadius!),
      ),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final double width;
  final double borderRadius;
  const HexagonPainter({required this.width, required this.borderRadius});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = width / 2;
    final center = Offset(width / 2, width / 2);
    const angle = (pi * 2) / 6;
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final path = Path();
    final firstOffset = Offset(radius * cos(0.0), radius * sin(0.0));
    // 시작점으로 이동
    path.moveTo(firstOffset.dx + center.dx, firstOffset.dy + center.dy);
    for (int i = 0; i < 7; i++) {
      // 첫번째 각도와 두번째 각도 계산
      final currAngle = angle * i;
      final nextAngle = angle * (i + 1);
      // 첫번째 좌표 계산
      final currX = radius * cos(currAngle) + center.dx;
      final currY = radius * sin(currAngle) + center.dy;
      // 두번째 좌표 계산
      final nextX = radius * cos(nextAngle) + center.dx;
      final nextY = radius * sin(nextAngle) + center.dy;
      // Radius를 위한 Rect 선언
      final Rect firstOval =
          Rect.fromCircle(center: Offset(currX, currY), radius: borderRadius);
      // Radius 그리기
      path.arcTo(firstOval, currAngle - pi / 6, pi / 3, false);

      final lineOffset = Offset(borderRadius * cos(currAngle + pi / 6),
          borderRadius * sin(currAngle + pi / 6));

      // Hexagon line 끝점으로 라인 그리기
      path.lineTo(lineOffset.dx + nextX, lineOffset.dy + nextY);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
