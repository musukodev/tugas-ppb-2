import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_colors.dart';
import '../widgets/empty_notes.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.notes,
    required this.onOpenNote,
    required this.onAddNote,
  });

  final List<Note> notes;
  final ValueChanged<Note> onOpenNote;
  final VoidCallback onAddNote;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  String selectedCategory = 'Semua';
  final categories = const ['Semua', 'Penting', 'Pribadi', 'Kerja'];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = searchController.text.toLowerCase();
    final visibleNotes = widget.notes.where((note) {
      final matchesSearch =
          note.title.toLowerCase().contains(query) ||
          note.body.toLowerCase().contains(query);
      final matchesCategory =
          selectedCategory == 'Semua' ||
          (selectedCategory == 'Penting' && note.priority == 'Penting') ||
          note.category == selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, Fawwaz',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Apa yang ingin kamu catat hari ini?',
                            style: TextStyle(color: AppColors.muted),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: AppColors.greenSoft,
                        child: Icon(
                          Icons.person_rounded,
                          color: AppColors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  TextField(
                    controller: searchController,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Cari catatan...',
                      prefixIcon: const Icon(Icons.search_rounded),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        tooltip: 'Urutkan catatan',
                        icon: const Icon(Icons.tune_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 38,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, index) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return ChoiceChip(
                          label: Text(category),
                          selected: selectedCategory == category,
                          onSelected: (_) =>
                              setState(() => selectedCategory = category),
                          selectedColor: AppColors.green,
                          labelStyle: TextStyle(
                            color: selectedCategory == category
                                ? AppColors.surface
                                : AppColors.ink,
                            fontWeight: FontWeight.w600,
                          ),
                          side: const BorderSide(color: AppColors.rule),
                          showCheckmark: false,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Catatan terbaru',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${visibleNotes.length} catatan',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (visibleNotes.isEmpty)
            const SliverFillRemaining(hasScrollBody: false, child: EmptyNotes())
          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100),
              sliver: SliverList.separated(
                itemCount: visibleNotes.length,
                separatorBuilder: (_, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) => NoteCard(
                  note: visibleNotes[index],
                  onTap: () => widget.onOpenNote(visibleNotes[index]),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
