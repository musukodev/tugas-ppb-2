import '../models/note.dart';
import '../theme/app_colors.dart';

final List<Note> initialNotes = [
  Note(
    title: 'Ide Aplikasi',
    body: 'Ide untuk membuat aplikasi catatan sederhana dengan fitur kategori, warna, dan prioritas. Aplikasi ini digunakan untuk mencatat ide, rencana, dan hal penting sehari-hari.',
    category: 'Pribadi',
    date: '19 Oktober 2026',
    color: AppColors.yellow,
    priority: 'Penting',
  ),
  Note(
    title: 'Rencana Mingguan',
    body: 'Merapikan jadwal, menyelesaikan tugas, dan menyediakan waktu untuk membaca.',
    category: 'Kerja',
    date: '18 Oktober 2026',
    color: AppColors.greenSoft,
    priority: 'Sedang',
  ),
  Note(
    title: 'Catatan Kuliah',
    body: 'Ringkasan materi pertemuan hari ini dan beberapa pertanyaan untuk dibahas kembali.',
    category: 'Kuliah',
    date: '17 Oktober 2026',
    color: AppColors.lilac,
    priority: 'Sedang',
  ),
  Note(
    title: 'Hal yang Perlu Dibeli',
    body: 'Buku catatan, tinta printer, dan kabel charger.',
    category: 'Belanja',
    date: '16 Oktober 2026',
    color: AppColors.blush,
    priority: 'Rendah',
  ),
  Note(
    title: 'Jurnal Harian',
    body: 'Hari ini berjalan lebih tenang. Saya menyelesaikan satu hal penting dan beristirahat cukup.',
    category: 'Pribadi',
    date: '15 Oktober 2026',
    color: AppColors.sky,
    priority: 'Rendah',
  ),
];
