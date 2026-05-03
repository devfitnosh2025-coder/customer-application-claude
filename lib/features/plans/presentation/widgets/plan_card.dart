import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum PlanCtaState { upgrade, downgrade, current }

class PlanCard extends StatelessWidget {
  final String name;
  final String price;
  final String subtitle;
  final String description;
  final PlanCtaState ctaState;
  final bool highlight;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.name,
    required this.price,
    required this.subtitle,
    required this.description,
    required this.ctaState,
    required this.onTap,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;

    final card = Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurfaceColor : AppTheme.contentCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: highlight
              ? AppTheme.primaryColor
              : (isDark
                  ? AppTheme.darkBorderColor
                  : AppTheme.contentCardBorder),
          width: highlight ? 2 : 1,
        ),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.headlineMedium!.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppTheme.secondaryColor
                            : AppTheme.caTextPrimary,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      spacing: 4,
                      children: [
                        Text(
                          price,
                          style: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: isDark
                                ? AppTheme.secondaryColor
                                : AppTheme.caTextPrimary,
                          ),
                        ),
                        Text(
                          '/ ${appLoc.perMonth}',
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: AppTheme.caTextSecondary,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontSize: 13,
                        color: AppTheme.caTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              _buildCta(context, appLoc),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: theme.textTheme.bodySmall!.copyWith(
              fontSize: 12,
              color: AppTheme.caTextWarmGray,
            ),
          ),
        ],
      ),
    );

    if (!highlight) return card;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        card,
        Positioned(
          top: -12,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Text(
                appLoc.mostPopular,
                style: theme.textTheme.labelSmall!.copyWith(
                  fontSize: 10,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCta(BuildContext context, AppLocalizations appLoc) {
    final theme = Theme.of(context);
    String label;
    Color bg;
    Color fg;
    Color border;
    switch (ctaState) {
      case PlanCtaState.current:
        label = appLoc.current;
        bg = AppTheme.contentDivider;
        fg = AppTheme.caTextPrimary;
        border = AppTheme.contentCardBorder;
        break;
      case PlanCtaState.upgrade:
        label = appLoc.upgrade;
        bg = AppTheme.transparentColor;
        fg = AppTheme.primaryColor;
        border = AppTheme.primaryColor;
        break;
      case PlanCtaState.downgrade:
        label = appLoc.downgrade;
        bg = AppTheme.transparentColor;
        fg = AppTheme.caTextPrimary;
        border = AppTheme.contentCardBorder;
        break;
    }
    return InkWell(
      borderRadius: BorderRadius.circular(99),
      onTap: () {
        HapticFeedback.heavyImpact();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: border, width: 1.5),
        ),
        child: Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: fg,
          ),
        ),
      ),
    );
  }
}
