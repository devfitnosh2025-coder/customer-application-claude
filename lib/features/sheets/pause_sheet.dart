import 'package:customer_app/common/widgets/k_bottom_sheet.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showPauseSheet(BuildContext context) =>
    showKBottomSheet(context: context, child: const _PauseSheet());

class _PauseSheet extends StatelessWidget {
  const _PauseSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final appLoc = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      spacing: 14,
      children: [
        Text(
          appLoc.pauseYourPlan,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppTheme.secondaryColor
                : AppTheme.caTextPrimary,
          ),
        ),
        Text(
          appLoc.pauseDesc,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 12,
            color: AppTheme.caTextWarmGray,
          ),
        ),
        _DateField(label: appLoc.startDate, value: 'Apr 15, 2026'),
        _DateField(label: appLoc.endDate, value: 'Apr 29, 2026'),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppTheme.contentDivider,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 2,
            children: [
              Text(
                appLoc.fourteenDayPauseLine,
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.caTextPrimary,
                ),
              ),
              Text(
                appLoc.pausesUsedLine,
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  color: AppTheme.caTextWarmGray,
                ),
              ),
            ],
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(99),
          onTap: () {
            HapticFeedback.heavyImpact();
            GoRouter.of(context).pop();
          },
          child: Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8AF),
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              appLoc.pausePlan,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFB8860B),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DateField extends StatelessWidget {
  final String label;
  final String value;
  const _DateField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall!.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppTheme.caTextSecondary,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: AppTheme.contentBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.contentCardBorder, width: 1),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.caTextPrimary,
                  ),
                ),
              ),
              const Icon(Icons.expand_more, color: AppTheme.caTextMuted),
            ],
          ),
        ),
      ],
    );
  }
}
