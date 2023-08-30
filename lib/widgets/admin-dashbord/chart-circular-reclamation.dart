import 'package:flutter/material.dart';
import 'dart:math';

import 'package:partenaire/utils/colors-by-dii.dart';

class CircularChartReclamation extends StatelessWidget {
  final double chartRadius = 40.0;
  final double strokeWidth = 15.0;
  final double value = 0.7;
  final Color color;

  const CircularChartReclamation(
      {super.key, required this.color}); // Change this value for chart progress

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: chartRadius * 2,
      height: chartRadius * 2,
      child: CustomPaint(
        painter: ChartPainter(strokeWidth, value, color),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '70%',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('réclamations traité',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final Color color;

  ChartPainter(this.strokeWidth, this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 3.5;

    final backgroundPaint = Paint()
      ..color = noir.withOpacity(.4)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final foregroundPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * value;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
