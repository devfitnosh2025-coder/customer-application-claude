import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileSectionHeader extends StatelessWidget {
  final String label;
  const ProfileSectionHeader({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
      child: Text(
        label,
        style: theme.textTheme.labelSmall!.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: isDark ? AppTheme.caTextMuted : AppTheme.caTextSecondary,
        ),
      ),
    );
  }
}
