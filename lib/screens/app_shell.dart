import 'package:flutter/material.dart';

import '../data/sample_notes.dart';
import '../models/note.dart';
import '../theme/app_colors.dart';
import 'add_note_screen.dart';
import 'archive_screen.dart';
import 'home_screen.dart';
import 'note_detail_screen.dart';
import 'profile_screen.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final notes = List<Note>.from(initialNotes);
  int selectedIndex = 0;

  Future<void> openAddNote() async {
    final note = await Navigator.of(context).push<Note>(
      MaterialPageRoute<Note>(builder: (_) => const AddNoteScreen()),
    );
    if (note != null) setState(() => notes.insert(0, note));
  }

  void openDetail(Note note) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => NoteDetailScreen(
          note: note,
          onDelete: () {
            setState(() => notes.remove(note));
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(notes: notes, onOpenNote: openDetail, onAddNote: openAddNote),
      ArchiveScreen(notes: notes),
      const ProfileScreen(),
    ];
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      floatingActionButton: selectedIndex == 0
          ? FloatingActionButton(
              onPressed: openAddNote,
              tooltip: 'Tambah catatan',
              backgroundColor: AppColors.green,
              foregroundColor: AppColors.surface,
              child: const Icon(Icons.add_rounded, size: 30),
            )
          : null,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) => setState(() => selectedIndex = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.archive_outlined),
            selectedIcon: Icon(Icons.archive_rounded),
            label: 'Arsip',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
