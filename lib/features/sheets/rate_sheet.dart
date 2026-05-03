import 'package:customer_app/common/widgets/k_bottom_sheet.dart';
import 'package:customer_app/core/theme/app_theme.dart';
import 'package:customer_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

Future<void> showRateSheet(BuildContext context) =>
    showKBottomSheet(context: context, child: const _RateSheet());

class _RateSheet extends StatefulWidget {
  const _RateSheet();

  @override
  State<_RateSheet> createState() => _RateSheetState();
}

class _RateSheetState extends State<_RateSheet> {
  int _stars = 4;
  double _taste = 4;
  double _portion = 4;
  double _presentation = 4;
  final TextEditingController _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

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
          appLoc.rateMealTitle,
          style: theme.textTheme.headlineMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppTheme.secondaryColor
                : AppTheme.caTextPrimary,
          ),
        ),
        Text(
          appLoc.rateMealSub,
          style: theme.textTheme.bodySmall!.copyWith(
            fontSize: 12,
            color: AppTheme.caTextWarmGray,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: List.generate(5, (i) {
            return GestureDetector(
              onTap: () {
                HapticFeedback.heavyImpact();
                setState(() => _stars = i + 1);
              },
              child: Icon(
                i < _stars ? Icons.star_rounded : Icons.star_border_rounded,
                color: const Color(0xFFE9A23B),
                size: 32,
              ),
            );
          }),
        ),
        Center(
          child: Text(
            appLoc.great,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: const Color(0xFFE9A23B),
            ),
          ),
        ),
        _slider(theme, appLoc.taste, _taste, (v) => setState(() => _taste = v)),
        _slider(theme, appLoc.portionSizeShort, _portion,
            (v) => setState(() => _portion = v)),
        _slider(theme, appLoc.presentation, _presentation,
            (v) => setState(() => _presentation = v)),
        Row(
          spacing: 10,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppTheme.contentDivider,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_a_photo_outlined,
                      size: 16, color: AppTheme.caTextSecondary),
                  Text(
                    appLoc.photo,
                    style: theme.textTheme.labelSmall!.copyWith(
                      fontSize: 9,
                      color: AppTheme.caTextSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TextField(
                controller: _ctrl,
                style: theme.textTheme.bodyLarge,
                decoration: InputDecoration(
                  hintText: appLoc.feedbackOptional,
                  hintStyle: theme.textTheme.bodyMedium!.copyWith(
                    color: AppTheme.caTextMuted,
                  ),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                  filled: true,
                  fillColor: AppTheme.contentBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppTheme.contentCardBorder),
                  ),
                ),
              ),
            ),
          ],
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
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(99),
            ),
            child: Text(
              appLoc.submitRating,
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppTheme.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _slider(
    ThemeData theme,
    String label,
    double value,
    ValueChanged<double> onChanged,
  ) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontSize: 13,
              color: AppTheme.caTextSecondary,
            ),
          ),
        ),
        Expanded(
          child: SliderTheme(
            data: const SliderThemeData(
              activeTrackColor: AppTheme.primaryColor,
              thumbColor: AppTheme.primaryColor,
              inactiveTrackColor: AppTheme.contentDivider,
            ),
            child: Slider(
              value: value,
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: onChanged,
            ),
          ),
        ),
        Text(
          '${value.toInt()}/5',
          style: theme.textTheme.labelSmall!.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: AppTheme.caTextPrimary,
          ),
        ),
      ],
    );
  }
}
