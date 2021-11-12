import 'package:flutter/material.dart';

class CanvasPaint extends CustomPainter
{
  // Origem: canto superior-esquerdo
  @override
  void paint(Canvas canvas, Size size)
  {
    // Paint
    final paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;
    paint.color = Colors.red;

    // RRect
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 20, 100, 150), Radius.circular(20)),
      paint,
    );

    // Oval
    canvas.drawOval(
      Rect.fromLTWH(size.width - 150, 0, 100, 120),
      paint,
    );

    paint.color = Colors.yellow;

    // Path
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, size.height-20);
    path.lineTo(0, size.height-20);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }



}