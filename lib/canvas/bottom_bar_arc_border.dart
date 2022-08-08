import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:weather_app/themes/app_colors.dart';

class CustomBottomNavigationBarArcPainter extends CustomPainter {
  final Color borderColor = AppColors.tabBarBorder.withOpacity(0.1);
  final Color background1 = AppColors.tabBarBackground1.withOpacity(0.26);
  final Color background2 = AppColors.tabBarBackground2.withOpacity(0.26);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paintLine = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = borderColor;

    final Path pathLine = Path();

    pathLine.moveTo(0, size.height * 0.40);
    pathLine.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.6,
    );

    pathLine.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.40,
    );

    pathLine.lineTo(size.width, size.height);
    pathLine.lineTo(0, size.height);

    pathLine.close();

    canvas.drawPath(pathLine, paintLine);

    Paint paintFill = Paint()
      ..shader = ui.Gradient.linear(
        const ui.Offset(0, 0),
        ui.Offset(size.width, size.height),
        [background1, background2],
      )
      ..style = PaintingStyle.fill;

    final Path pathFill = Path();

    pathFill.moveTo(0, size.height * 0.40);
    pathFill.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.6,
      size.width * 0.5,
      size.height * 0.6,
    );

    pathFill.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.6,
      size.width,
      size.height * 0.40,
    );

    pathFill.lineTo(size.width, size.height);
    pathFill.lineTo(0, size.height);

    pathFill.close();

    canvas.drawPath(pathFill, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
