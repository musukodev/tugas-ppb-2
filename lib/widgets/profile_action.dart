import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: Icon(icon, color: AppColors.green),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.muted),
      onTap: () {},
    );
  }
}
