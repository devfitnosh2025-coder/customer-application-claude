import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressCard extends StatelessWidget {
  final String label;
  final String addressLine1;
  final String addressLine2;
  final bool isDefault;
  final VoidCallback onEditTap;
  final VoidCallback onMoreTap;

  const AddressCard({
    super.key,
    required this.label,
    required this.addressLine1,
    required this.addressLine2,
    required this.onEditTap,
    required this.onMoreTap,
    this.isDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? AppTheme.darkBorderColor
              : AppTheme.contentCardBorder,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isDefault)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: const BoxDecoration(
                color: AppTheme.contentDivider,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Text(
                appLoc.defaultLabel,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall!.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.4,
                  color: AppTheme.caTextSecondary,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        label,
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? AppTheme.secondaryColor
                              : AppTheme.caTextPrimary,
                        ),
                      ),
                      Text(
                        addressLine1,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: AppTheme.caTextWarmGray,
                        ),
                      ),
                      Text(
                        addressLine2,
                        style: theme.textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                          color: AppTheme.caTextWarmGray,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 8,
                  children: [
                    InkWell(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        onEditTap();
                      },
                      child: Text(
                        appLoc.edit,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        onMoreTap();
                      },
                      child: const Icon(
                        Icons.more_horiz,
                        size: 18,
                        color: AppTheme.caTextMuted,
                      ),
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
}
