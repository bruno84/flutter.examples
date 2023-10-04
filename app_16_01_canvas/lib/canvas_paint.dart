import 'package:flutter/material.dart';

class CanvasPaint extends CustomPainter
{
  // Origem: canto superior-esquerdo
  @override
  void paint(Canvas canvas, Size size)
  {
    //--------------------------------------------------------
    // Paint1
    //--------------------------------------------------------
    final paint1 = Paint();
    paint1.style = PaintingStyle.stroke;
    paint1.strokeWidth = 4.0;
    paint1.color = Colors.red;

    // RRect
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromLTWH(0, 20, 100, 150), Radius.circular(20)),
      paint1,
    );

    // Oval
    canvas.drawOval(
      Rect.fromLTWH(size.width - 150, 0, 100, 120),
      paint1,
    );

    // A alteração refletirá apenas nas novas primitivas
    paint1.color = Colors.yellow;

    // Path
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.5);
    path.lineTo(size.width, size.height-20);
    path.lineTo(0, size.height-20);
    canvas.drawPath(path, paint1);

    //--------------------------------------------------------
    // Paint2
    //--------------------------------------------------------
    final paint2 = Paint();
    paint2.color = Colors.orange;
    paint1.style = PaintingStyle.fill;

    // Oval
    canvas.drawOval(
      Rect.fromLTWH(0, 200, 50, 50),
      paint2,
    );

  }



  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }



}