import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderListTile extends StatelessWidget {
  final String name;
  final String time;
  final String calories;
  final bool isDelivered;
  final Color thumbColor;
  final VoidCallback onRateTap;

  const OrderListTile({
    super.key,
    required this.name,
    required this.time,
    required this.calories,
    required this.isDelivered,
    required this.thumbColor,
    required this.onRateTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
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
      child: Row(
        spacing: 12,
        children: [
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              color: thumbColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
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
                  '$time • $calories',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontSize: 12,
                    color: AppTheme.caTextWarmGray,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 6,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: isDelivered
                      ? AppTheme.emeraldLight
                      : const Color(0xFFFFF4D6),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  isDelivered ? appLoc.delivered : appLoc.preparing,
                  style: theme.textTheme.labelSmall!.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isDelivered
                        ? AppTheme.emeraldText
                        : const Color(0xFFB8860B),
                  ),
                ),
              ),
              if (isDelivered)
                InkWell(
                  onTap: () {
                    HapticFeedback.heavyImpact();
                    onRateTap();
                  },
                  child: Text(
                    appLoc.rateMeal,
                    style: theme.textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
