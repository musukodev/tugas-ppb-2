import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, this.size = 44});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(size * .25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x24137A4C),
            blurRadius: 16,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Icon(
        Icons.edit_note_rounded,
        color: AppColors.surface,
        size: size * .65,
      ),
    );
  }
}
