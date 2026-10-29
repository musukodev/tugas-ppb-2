import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SplashPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    paint.color = AppColors.greenSoft.withValues(alpha: .48);
    canvas.drawCircle(Offset(size.width * .1, size.height * .18), 110, paint);
    paint.color = AppColors.sky.withValues(alpha: .7);
    canvas.drawCircle(Offset(size.width * .92, size.height * .77), 150, paint);
    paint.color = AppColors.yellow.withValues(alpha: .45);
    canvas.drawCircle(Offset(size.width * .88, size.height * .08), 75, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
