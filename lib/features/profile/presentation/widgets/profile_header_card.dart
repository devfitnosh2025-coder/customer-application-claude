import 'package:customer_app/common/widgets/k_profile_avatar.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final VoidCallback onEditTap;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    final initials = name.isNotEmpty ? name[0] : "U";

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Row(
        spacing: 14,
        children: [
          KProfileAvatar(
            initials: initials,
            height: 56,
            width: 56,
            backgroundColor: AppTheme.primaryColor,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  name,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  appLoc.profileFitProPlanActive,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 13,
                    color: isDark
                        ? AppTheme.caTextMuted
                        : AppTheme.caTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(99),
            onTap: () {
              HapticFeedback.heavyImpact();
              onEditTap();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppTheme.transparentColor,
                borderRadius: BorderRadius.circular(99),
                border: Border.all(
                  color: isDark
                      ? AppTheme.darkBorderColor
                      : AppTheme.contentCardBorder,
                  width: 1,
                ),
              ),
              child: Text(
                appLoc.edit,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppTheme.secondaryColor
                      : AppTheme.caTextPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
