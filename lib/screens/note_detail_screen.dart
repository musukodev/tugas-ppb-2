import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_colors.dart';

class NoteDetailScreen extends StatelessWidget {
  const NoteDetailScreen({
    super.key,
    required this.note,
    required this.onDelete,
  });

  final Note note;
  final VoidCallback onDelete;

  Future<void> confirmDelete(BuildContext context) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus catatan?'),
        content: const Text('Catatan ini akan dihapus dari daftar.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (shouldDelete == true) onDelete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Edit catatan',
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () => confirmDelete(context),
            tooltip: 'Hapus catatan',
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFB65050),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: note.color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.lightbulb_outline_rounded,
                  color: AppColors.green,
                  size: 30,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    note.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                size: 17,
                color: AppColors.muted,
              ),
              const SizedBox(width: 8),
              Text(note.date, style: const TextStyle(color: AppColors.muted)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('•', style: TextStyle(color: AppColors.rule)),
              ),
              Text(
                note.priority,
                style: const TextStyle(color: AppColors.muted),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Divider(color: AppColors.rule),
          ),
          Text(
            note.body,
            style: const TextStyle(
              fontSize: 17,
              height: 1.7,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.greenSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.folder_open_rounded, color: AppColors.green),
                const SizedBox(width: 10),
                Text(
                  'Kategori: ${note.category}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.greenDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
