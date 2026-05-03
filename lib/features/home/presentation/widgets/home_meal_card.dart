import 'package:customer_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeMealCard extends StatelessWidget {
  final String slot;
  final String name;
  final String calMeta;
  final String status;
  final Color statusColor;
  final Color thumbColor;
  final VoidCallback onPrimaryTap;
  final String primaryActionLabel;
  final List<String> secondaryActions;
  final ValueChanged<int>? onSecondaryTap;

  const HomeMealCard({
    super.key,
    required this.slot,
    required this.name,
    required this.calMeta,
    required this.status,
    required this.statusColor,
    required this.thumbColor,
    required this.onPrimaryTap,
    required this.primaryActionLabel,
    this.secondaryActions = const [],
    this.onSecondaryTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        spacing: 12,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: thumbColor,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Text(
                      slot,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.caTextSecondary,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: theme.textTheme.labelSmall!.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  name,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppTheme.secondaryColor
                        : AppTheme.caTextPrimary,
                  ),
                ),
                Text(
                  calMeta,
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: [
                    _action(theme, primaryActionLabel,
                        primary: true, onTap: onPrimaryTap),
                    for (var i = 0; i < secondaryActions.length; i++)
                      _action(
                        theme,
                        secondaryActions[i],
                        primary: false,
                        onTap: () => onSecondaryTap?.call(i),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _action(ThemeData theme, String label,
      {required bool primary, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: primary ? const Color(0xFFFFE8AF) : AppTheme.contentDivider,
          borderRadius: BorderRadius.circular(99),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: primary
                ? const Color(0xFFB8860B)
                : AppTheme.caTextPrimary,
          ),
        ),
      ),
    );
  }
}
