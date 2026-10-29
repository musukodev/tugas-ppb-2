import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/profile_action.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
        children: [
          Text('Profil', style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.greenSoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.surface,
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.green,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fawwaz',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Fawwaz@email.com',
                      style: TextStyle(color: AppColors.muted),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const ProfileAction(
            icon: Icons.notifications_none_rounded,
            title: 'Notifikasi',
            subtitle: 'Pengingat catatan',
          ),
          const ProfileAction(
            icon: Icons.palette_outlined,
            title: 'Tampilan',
            subtitle: 'Mode terang',
          ),
          const ProfileAction(
            icon: Icons.help_outline_rounded,
            title: 'Bantuan',
            subtitle: 'Pelajari CatatanKu',
          ),
        ],
      ),
    );
  }
}
