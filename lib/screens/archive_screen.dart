import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_colors.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key, required this.notes});

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
        children: [
          Text('Arsip', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 8),
          const Text(
            'Catatan yang kamu simpan akan muncul di sini.',
            style: TextStyle(color: AppColors.muted),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.rule),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.archive_outlined,
                  color: AppColors.green,
                  size: 30,
                ),
                const SizedBox(height: 16),
                Text(
                  'Belum ada arsip',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 6),
                Text(
                  '${notes.length} catatan aktif tersimpan di Beranda.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
