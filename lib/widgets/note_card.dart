import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_colors.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.onTap});

  final Note note;
  final VoidCallback onTap;

  IconData get categoryIcon {
    switch (note.category) {
      case 'Kerja':
        return Icons.calendar_month_rounded;
      case 'Kuliah':
        return Icons.menu_book_rounded;
      case 'Belanja':
        return Icons.shopping_cart_outlined;
      default:
        return Icons.lightbulb_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: note.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.surface.withValues(alpha: .72),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(categoryIcon, color: AppColors.green, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.ink,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      note.date,
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_vert_rounded, color: AppColors.ink),
            ],
          ),
        ),
      ),
    );
  }
}
