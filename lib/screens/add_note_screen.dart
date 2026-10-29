import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_colors.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  String category = 'Pribadi';
  String priority = 'Sedang';
  Color noteColor = AppColors.sky;
  final colors = const [
    AppColors.sky,
    AppColors.greenSoft,
    AppColors.yellow,
    AppColors.blush,
    AppColors.lilac,
  ];

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  void saveNote() {
    if (formKey.currentState?.validate() != true) return;
    Navigator.of(context).pop(
      Note(
        title: titleController.text.trim(),
        body: bodyController.text.trim(),
        category: category,
        date: 'Hari ini',
        color: noteColor,
        priority: priority,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah catatan',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Kembali',
          icon: const Icon(Icons.arrow_back_rounded),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            const Text(
              'Judul catatan',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Masukkan judul catatan',
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Judul belum diisi.'
                  : null,
            ),
            const SizedBox(height: 20),
            const Text(
              'Isi catatan',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: bodyController,
              maxLines: 6,
              decoration: const InputDecoration(
                hintText: 'Tulis catatanmu di sini...',
                alignLabelWithHint: true,
              ),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Isi catatan belum diisi.'
                  : null,
            ),
            const SizedBox(height: 24),
            const Text(
              'Kategori',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: category,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.folder_open_rounded),
              ),
              items: const ['Pribadi', 'Kerja', 'Kuliah', 'Belanja']
                  .map(
                    (value) =>
                        DropdownMenuItem(value: value, child: Text(value)),
                  )
                  .toList(),
              onChanged: (value) =>
                  setState(() => category = value ?? category),
            ),
            const SizedBox(height: 22),
            const Text(
              'Warna catatan',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            Row(
              children: colors.map((color) {
                final isSelected = noteColor == color;
                return GestureDetector(
                  onTap: () => setState(() => noteColor = color),
                  child: Container(
                    width: 38,
                    height: 38,
                    margin: const EdgeInsets.only(right: 14),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: AppColors.green, width: 3)
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check_rounded,
                            size: 19,
                            color: AppColors.green,
                          )
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            const Text(
              'Prioritas',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 10),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'Rendah', label: Text('Rendah')),
                ButtonSegment(value: 'Sedang', label: Text('Sedang')),
                ButtonSegment(value: 'Penting', label: Text('Penting')),
              ],
              selected: {priority},
              onSelectionChanged: (value) =>
                  setState(() => priority = value.first),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: saveNote,
                icon: const Icon(Icons.check_rounded),
                label: const Text('Simpan catatan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
