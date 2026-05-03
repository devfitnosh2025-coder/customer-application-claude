import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileMenuTile extends StatelessWidget {
  final IconData leadingIcon;
  final Color leadingColor;
  final Color leadingBgColor;
  final String label;
  final VoidCallback onTap;
  final bool showDivider;

  const ProfileMenuTile({
    super.key,
    required this.leadingIcon,
    required this.leadingColor,
    required this.leadingBgColor,
    required this.label,
    required this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Material(
      color: AppTheme.transparentColor,
      child: InkWell(
        onTap: () {
          HapticFeedback.heavyImpact();
          onTap();
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                spacing: 14,
                children: [
                  Container(
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      color: leadingBgColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(leadingIcon, color: leadingColor, size: 18),
                  ),
                  Expanded(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppTheme.caTextMuted,
                    size: 22,
                  ),
                ],
              ),
            ),
            if (showDivider)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: isDark
                      ? AppTheme.darkBorderColor
                      : AppTheme.contentDivider,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
